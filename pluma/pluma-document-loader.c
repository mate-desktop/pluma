/*
 * pluma-document-loader.c
 * This file is part of pluma
 *
 * Copyright (C) 2005 - Paolo Maggi
 * Copyright (C) 2007 - Paolo Maggi, Steve Frécinaux
 * Copyright (C) 2012-2021 MATE Developers
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

/*
 * Modified by the pluma Team, 2005-2007. See the AUTHORS file for a
 * list of people on the pluma Team.
 * See the ChangeLog files for a list of changes.
 *
 * $Id$
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <glib/gi18n.h>
#include <glib/gstdio.h>
#include <gio/gio.h>

#include "pluma-document-loader.h"
#include "pluma-document-output-stream.h"
#include "pluma-smart-charset-converter.h"
#include "pluma-debug.h"
#include "pluma-metadata-manager.h"
#include "pluma-utils.h"
#include "pluma-enum-types.h"
#include "pluma-settings.h"

#ifndef ENABLE_GVFS_METADATA
#include "pluma-metadata-manager.h"
#endif

typedef struct
{
    PlumaDocumentLoader  *loader;
    GCancellable         *cancellable;
    gssize                read;
    gboolean              tried_mount;
} AsyncData;

/* Signals */

enum {
    LOADING,
    LAST_SIGNAL
};

static guint signals[LAST_SIGNAL] = { 0 };

/* Properties */

enum
{
    PROP_0,
    PROP_DOCUMENT,
    PROP_URI,
    PROP_ENCODING,
    PROP_NEWLINE_TYPE,
    PROP_TRIM_TRAILING_NEWLINE,
    PROP_TRIMMED_TRAILING_NEWLINE,
};

#define READ_CHUNK_SIZE 8192
#define REMOTE_QUERY_ATTRIBUTES G_FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE "," \
                                G_FILE_ATTRIBUTE_STANDARD_TYPE "," \
                                G_FILE_ATTRIBUTE_TIME_MODIFIED "," \
                                G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC "," \
                                G_FILE_ATTRIBUTE_STANDARD_SIZE "," \
                                G_FILE_ATTRIBUTE_ACCESS_CAN_WRITE "," \
                                PLUMA_METADATA_ATTRIBUTE_ENCODING

static void open_async_read (AsyncData *async);

struct _PlumaDocumentLoaderPrivate
{
    GSettings                   *enc_settings;

    PlumaDocument               *document;
    gboolean                     used;

    /* Info on the current file */
    GFileInfo                   *info;
    gchar                       *uri;
    const PlumaEncoding         *encoding;
    const PlumaEncoding         *auto_detected_encoding;
    PlumaDocumentNewlineType     auto_detected_newline_type;
    GFile                       *gfile;
    goffset                      bytes_read;
    gboolean                     trim_trailing_newline;

    /* Handle for remote files */
    GCancellable                *cancellable;
    GInputStream                *stream;
    GOutputStream               *output;
    PlumaSmartCharsetConverter  *converter;

    gchar                        buffer[READ_CHUNK_SIZE];

    GError                      *error;
};

G_DEFINE_TYPE_WITH_PRIVATE (PlumaDocumentLoader, pluma_document_loader, G_TYPE_OBJECT)

static void
pluma_document_loader_set_property (GObject      *object,
                                    guint         prop_id,
                                    const GValue *value,
                                    GParamSpec   *pspec)
{
    PlumaDocumentLoader *loader = PLUMA_DOCUMENT_LOADER (object);

    switch (prop_id)
    {
        case PROP_DOCUMENT:
            g_return_if_fail (loader->priv->document == NULL);
            loader->priv->document = g_value_get_object (value);
            break;
        case PROP_URI:
            g_return_if_fail (loader->priv->uri == NULL);
            loader->priv->uri = g_value_dup_string (value);
            break;
        case PROP_ENCODING:
            g_return_if_fail (loader->priv->encoding == NULL);
            loader->priv->encoding = g_value_get_boxed (value);
            break;
        case PROP_NEWLINE_TYPE:
            loader->priv->auto_detected_newline_type = g_value_get_enum (value);
            break;
        case PROP_TRIM_TRAILING_NEWLINE:
            loader->priv->trim_trailing_newline = g_value_get_boolean (value);
            break;
        default:
            G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
            break;
    }
}

static void
pluma_document_loader_get_property (GObject    *object,
                                    guint       prop_id,
                                    GValue     *value,
                                    GParamSpec *pspec)
{
    PlumaDocumentLoader *loader = PLUMA_DOCUMENT_LOADER (object);

    switch (prop_id)
    {
        case PROP_DOCUMENT:
            g_value_set_object (value, loader->priv->document);
            break;
        case PROP_URI:
            g_value_set_string (value, loader->priv->uri);
            break;
        case PROP_ENCODING:
            g_value_set_boxed (value, pluma_document_loader_get_encoding (loader));
            break;
        case PROP_NEWLINE_TYPE:
            g_value_set_enum (value, loader->priv->auto_detected_newline_type);
            break;
        case PROP_TRIM_TRAILING_NEWLINE:
            g_value_set_boolean (value, loader->priv->trim_trailing_newline);
            break;
        case PROP_TRIMMED_TRAILING_NEWLINE:
            if (loader->priv->output != NULL)
            {
                gboolean trimmed_trailing_newline;
                g_object_get (loader->priv->output,
                              "trimmed-trailing-newline", &trimmed_trailing_newline,
                              NULL);
                g_value_set_boolean (value, trimmed_trailing_newline);
            }
            else
            {
                g_value_set_boolean (value, FALSE);
            }
            break;
        default:
            G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
            break;
    }
}

static void
pluma_document_loader_finalize (GObject *object)
{
    PlumaDocumentLoaderPrivate *priv = pluma_document_loader_get_instance_private (PLUMA_DOCUMENT_LOADER(object));

    g_free (priv->uri);

    G_OBJECT_CLASS (pluma_document_loader_parent_class)->finalize (object);
}

static void
pluma_document_loader_dispose (GObject *object)
{
    PlumaDocumentLoaderPrivate *priv = pluma_document_loader_get_instance_private (PLUMA_DOCUMENT_LOADER(object));

    if (priv->cancellable != NULL)
    {
        g_cancellable_cancel (priv->cancellable);
        g_object_unref (priv->cancellable);
        priv->cancellable = NULL;
    }

    if (priv->stream != NULL)
    {
        g_object_unref (priv->stream);
        priv->stream = NULL;
    }

    if (priv->output != NULL)
    {
        g_object_unref (priv->output);
        priv->output = NULL;
    }

    if (priv->converter != NULL)
    {
        g_object_unref (priv->converter);
        priv->converter = NULL;
    }

    if (priv->gfile != NULL)
    {
        g_object_unref (priv->gfile);
        priv->gfile = NULL;
    }

    g_clear_error (&priv->error);

    if (priv->info != NULL)
    {
        g_object_unref (priv->info);
        priv->info = NULL;
    }

    g_clear_object (&priv->enc_settings);

    G_OBJECT_CLASS (pluma_document_loader_parent_class)->dispose (object);
}

static void
pluma_document_loader_class_init (PlumaDocumentLoaderClass *klass)
{
    GObjectClass *object_class = G_OBJECT_CLASS (klass);

    object_class->dispose = pluma_document_loader_dispose;
    object_class->finalize = pluma_document_loader_finalize;
    object_class->get_property = pluma_document_loader_get_property;
    object_class->set_property = pluma_document_loader_set_property;

    g_object_class_install_property (object_class,
                                     PROP_DOCUMENT,
                                     g_param_spec_object ("document",
                                                          "Document",
                                                          "The PlumaDocument this PlumaDocumentLoader is associated with",
                                                          PLUMA_TYPE_DOCUMENT,
                                                          G_PARAM_READWRITE |
                                                          G_PARAM_CONSTRUCT_ONLY |
                                                          G_PARAM_STATIC_STRINGS));

    g_object_class_install_property (object_class,
                                     PROP_URI,
                                     g_param_spec_string ("uri",
                                                          "URI",
                                                          "The URI this PlumaDocumentLoader loads the document from",
                                                          "",
                                                          G_PARAM_READWRITE |
                                                          G_PARAM_CONSTRUCT_ONLY));

    g_object_class_install_property (object_class,
                                     PROP_ENCODING,
                                     g_param_spec_boxed ("encoding",
                                                         "Encoding",
                                                         "The encoding of the saved file",
                                                         PLUMA_TYPE_ENCODING,
                                                         G_PARAM_READWRITE |
                                                         G_PARAM_CONSTRUCT_ONLY |
                                                         G_PARAM_STATIC_STRINGS));

    g_object_class_install_property (object_class,
                                     PROP_TRIM_TRAILING_NEWLINE,
                                     g_param_spec_boolean ("trim-trailing-newline",
                                                           "Trim Trailing Newline",
                                                           "Remove the final received newline from the document buffer?",
                                                           TRUE,
                                                           G_PARAM_READWRITE |
                                                           G_PARAM_STATIC_STRINGS |
                                                           G_PARAM_CONSTRUCT));

    g_object_class_install_property (object_class,
                                     PROP_TRIMMED_TRAILING_NEWLINE,
                                     g_param_spec_boolean ("trimmed-trailing-newline",
                                                           "Trailing Newline Trimmed",
                                                           "Was the final received newline removed from the document buffer?",
                                                           FALSE,
                                                           G_PARAM_READABLE |
                                                           G_PARAM_STATIC_STRINGS));

    signals[LOADING] =
        g_signal_new ("loading",
                      G_OBJECT_CLASS_TYPE (object_class),
                      G_SIGNAL_RUN_LAST,
                      G_STRUCT_OFFSET (PlumaDocumentLoaderClass, loading),
                      NULL, NULL, NULL,
                      G_TYPE_NONE,
                      2,
                      G_TYPE_BOOLEAN,
                      G_TYPE_POINTER);
}

static void
pluma_document_loader_init (PlumaDocumentLoader *loader)
{
    loader->priv = pluma_document_loader_get_instance_private (loader);

    loader->priv->used = FALSE;
    loader->priv->auto_detected_newline_type = PLUMA_DOCUMENT_NEWLINE_TYPE_DEFAULT;
    loader->priv->converter = NULL;
    loader->priv->error = NULL;
    loader->priv->enc_settings = g_settings_new (PLUMA_SCHEMA_ID);
}

PlumaDocumentLoader *
pluma_document_loader_new (PlumaDocument       *doc,
                           const gchar         *uri,
                           const PlumaEncoding *encoding)
{
    g_return_val_if_fail (PLUMA_IS_DOCUMENT (doc), NULL);

    return PLUMA_DOCUMENT_LOADER (g_object_new (PLUMA_TYPE_DOCUMENT_LOADER,
                                  "document", doc,
                                  "uri", uri,
                                  "encoding", encoding,
                                  NULL));
}

static AsyncData *
async_data_new (PlumaDocumentLoader *loader)
{
    AsyncData *async;

    async = g_slice_new (AsyncData);
    async->loader = loader;
    async->cancellable = g_object_ref (loader->priv->cancellable);
    async->tried_mount = FALSE;

    return async;
}

static void
async_data_free (AsyncData *async)
{
    g_object_unref (async->cancellable);
    g_slice_free (AsyncData, async);
}

static const PlumaEncoding *
get_metadata_encoding (PlumaDocumentLoader *loader)
{
    const PlumaEncoding *enc = NULL;

#ifndef ENABLE_GVFS_METADATA
    gchar *charset;
    const gchar *uri;

    uri = pluma_document_loader_get_uri (loader);

    charset = pluma_metadata_manager_get (uri, "encoding");

    if (charset == NULL)
        return NULL;

    enc = pluma_encoding_get_from_charset (charset);

    g_free (charset);
#else
    GFileInfo *info;

    info = pluma_document_loader_get_info (loader);

    /* check if the encoding was set in the metadata */
    if (g_file_info_has_attribute (info, PLUMA_METADATA_ATTRIBUTE_ENCODING))
    {
        const gchar *charset;

        charset = g_file_info_get_attribute_string (info, PLUMA_METADATA_ATTRIBUTE_ENCODING);

        if (charset == NULL)
            return NULL;

        enc = pluma_encoding_get_from_charset (charset);
    }
#endif

    return enc;
}

static void
remote_load_completed_or_failed (PlumaDocumentLoader *loader, AsyncData *async)
{
    pluma_document_loader_loading (loader,
                                   TRUE,
                                   loader->priv->error);

    if (async)
        async_data_free (async);
}

static void
async_failed (AsyncData *async, GError *error)
{
    g_propagate_error (&async->loader->priv->error, error);
    remote_load_completed_or_failed (async->loader, async);
}

static void
close_input_stream_ready_cb (GInputStream *stream,
                             GAsyncResult  *res,
                             AsyncData     *async)
{
    GError *error = NULL;

    pluma_debug (DEBUG_LOADER);

    /* check cancelled state manually */
    if (g_cancellable_is_cancelled (async->cancellable))
    {
        async_data_free (async);
        return;
    }

    pluma_debug_message (DEBUG_SAVER, "Finished closing input stream");

    if (!g_input_stream_close_finish (stream, res, &error))
    {
        pluma_debug_message (DEBUG_SAVER, "Closing input stream error: %s", error->message);

        async_failed (async, error);
        return;
    }

    pluma_debug_message (DEBUG_SAVER, "Close output stream");
    if (!g_output_stream_close (async->loader->priv->output, async->cancellable, &error))
    {
        async_failed (async, error);
        return;
    }

    remote_load_completed_or_failed (async->loader, async);
}

static void
write_complete (AsyncData *async)
{
    if (async->loader->priv->stream)
        g_input_stream_close_async (G_INPUT_STREAM (async->loader->priv->stream),
                                    G_PRIORITY_HIGH,
                                    async->cancellable,
                                    (GAsyncReadyCallback)close_input_stream_ready_cb,
                                    async);
}

/* prototype, because they call each other... isn't C lovely */
static void    read_file_chunk        (AsyncData *async);

static void
write_file_chunk (AsyncData *async)
{
    PlumaDocumentLoader *loader;
    gssize bytes_written;
    GError *error = NULL;

    loader = async->loader;

    /* we use sync methods on doc stream since it is in memory. Using async
       would be racy and we can endup with invalidated iters */
    bytes_written = g_output_stream_write (G_OUTPUT_STREAM (loader->priv->output),
                                           loader->priv->buffer,
                                           async->read,
                                           async->cancellable,
                                           &error);

    pluma_debug_message (DEBUG_SAVER, "Written: %" G_GSSIZE_FORMAT, bytes_written);
    if (bytes_written == -1)
    {
        pluma_debug_message (DEBUG_SAVER, "Write error: %s", error->message);
        async_failed (async, error);
        return;
    }

    /* note that this signal blocks the read... check if it isn't
     * a performance problem
     */
    pluma_document_loader_loading (loader, FALSE, NULL);

    read_file_chunk (async);
}

static void
async_read_cb (GInputStream *stream,
               GAsyncResult *res,
               AsyncData    *async)
{
    pluma_debug (DEBUG_LOADER);
    PlumaDocumentLoader *loader;
    GError *error = NULL;

    pluma_debug (DEBUG_LOADER);

    /* manually check cancelled state */
    if (g_cancellable_is_cancelled (async->cancellable))
    {
        async_data_free (async);
        return;
    }

    loader = async->loader;

    async->read = g_input_stream_read_finish (stream, res, &error);

    /* error occurred */
    if (async->read == -1)
    {
        async_failed (async, error);
        return;
    }

    /* Check for the extremely unlikely case where the file size overflows. */
    if (loader->priv->bytes_read + async->read < loader->priv->bytes_read)
    {
        g_set_error (&loader->priv->error,
                     PLUMA_DOCUMENT_ERROR,
                     PLUMA_DOCUMENT_ERROR_TOO_BIG,
                     "File too big");

        async_failed (async, loader->priv->error);
        return;
    }

    /* Bump the size. */
    loader->priv->bytes_read += async->read;

    /* end of the file, we are done! */
    if (async->read == 0)
    {
        g_output_stream_flush (loader->priv->output,
                               NULL,
                               &loader->priv->error);

        loader->priv->auto_detected_encoding =
            pluma_smart_charset_converter_get_guessed (loader->priv->converter);

        loader->priv->auto_detected_newline_type =
            pluma_document_output_stream_detect_newline_type (PLUMA_DOCUMENT_OUTPUT_STREAM (loader->priv->output));

        /* Check if we needed some fallback char, if so, check if there was
           a previous error and if not set a fallback used error */
        /* FIXME Uncomment this when we want to manage conversion fallback */
        /*if ((pluma_smart_charset_converter_get_num_fallbacks (loader->priv->converter) != 0) &&
            loader->priv->error == NULL)
        {
            g_set_error_literal (&loader->priv->error,
                         PLUMA_DOCUMENT_ERROR,
                         PLUMA_DOCUMENT_ERROR_CONVERSION_FALLBACK,
                         "There was a conversion error and it was "
                         "needed to use a fallback char");
        }*/

        write_complete (async);

        return;
    }

    write_file_chunk (async);
}

static void
read_file_chunk (AsyncData *async)
{
    PlumaDocumentLoader *loader;

    loader = async->loader;

    g_input_stream_read_async (G_INPUT_STREAM (loader->priv->stream),
                               loader->priv->buffer,
                               READ_CHUNK_SIZE,
                               G_PRIORITY_HIGH,
                               async->cancellable,
                               (GAsyncReadyCallback) async_read_cb,
                               async);
}

static GSList *
get_candidate_encodings (PlumaDocumentLoader *loader)
{
    const PlumaEncoding *metadata;
    GSList *encodings;
    gchar **enc_strv;

    enc_strv = g_settings_get_strv (loader->priv->enc_settings,
                                    PLUMA_SETTINGS_ENCODING_AUTO_DETECTED);

    encodings = _pluma_encoding_strv_to_list ((const gchar * const *)enc_strv);
    g_strfreev (enc_strv);

    metadata = get_metadata_encoding (loader);
    if (metadata != NULL)
    {
        encodings = g_slist_prepend (encodings, (gpointer)metadata);
    }

    return encodings;
}

static void
finish_query_info (AsyncData *async)
{
    PlumaDocumentLoader *loader;
    GInputStream *conv_stream;
    GFileInfo *info;
    GSList *candidate_encodings;

    loader = async->loader;
    info = loader->priv->info;

    /* if it's not a regular file, error out... */
    if (g_file_info_has_attribute (info, G_FILE_ATTRIBUTE_STANDARD_TYPE) &&
        g_file_info_get_file_type (info) != G_FILE_TYPE_REGULAR)
    {
        g_set_error (&loader->priv->error,
                     G_IO_ERROR,
                     G_IO_ERROR_NOT_REGULAR_FILE,
                    "Not a regular file");

        remote_load_completed_or_failed (loader, async);

        return;
    }

    /* Get the candidate encodings */
    if (loader->priv->encoding == NULL)
    {
        candidate_encodings = get_candidate_encodings (loader);
    }
    else
    {
        candidate_encodings = g_slist_prepend (NULL, (gpointer) loader->priv->encoding);
    }

    loader->priv->converter = pluma_smart_charset_converter_new (candidate_encodings);
    g_slist_free (candidate_encodings);

    conv_stream = g_converter_input_stream_new (loader->priv->stream,
                                                G_CONVERTER (loader->priv->converter));

    g_object_unref (loader->priv->stream);

    loader->priv->stream = conv_stream;

    /* Output stream */
    loader->priv->output = pluma_document_output_stream_new (loader->priv->document);
    g_object_set (G_OBJECT (loader->priv->output),
                  "trim-trailing-newline", loader->priv->trim_trailing_newline,
                  NULL);

    /* start reading */
    read_file_chunk (async);
}

static void
query_info_cb (GFile        *source,
               GAsyncResult *res,
               AsyncData    *async)
{
    GFileInfo *info;
    GError *error = NULL;

    pluma_debug (DEBUG_LOADER);

    /* manually check the cancelled state */
    if (g_cancellable_is_cancelled (async->cancellable))
    {
        async_data_free (async);
        return;
    }

    /* finish the info query */
    info = g_file_query_info_finish (async->loader->priv->gfile,
                                     res,
                                     &error);

    if (info == NULL)
    {
        /* propagate the error and clean up */
        async_failed (async, error);
        return;
    }

    async->loader->priv->info = info;

    finish_query_info (async);
}

static void
mount_ready_callback (GFile        *file,
                      GAsyncResult *res,
                      AsyncData    *async)
{
    GError *error = NULL;
    gboolean mounted;

    pluma_debug (DEBUG_LOADER);

    /* manual check for cancelled state */
    if (g_cancellable_is_cancelled (async->cancellable))
    {
        async_data_free (async);
        return;
    }

    mounted = g_file_mount_enclosing_volume_finish (file, res, &error);

    if (!mounted)
    {
        async_failed (async, error);
    }
    else
    {
        /* try again to open the file for reading */
        open_async_read (async);
    }
}

static void
recover_not_mounted (AsyncData *async)
{
    PlumaDocument *doc;
    GMountOperation *mount_operation;

    pluma_debug (DEBUG_LOADER);

    doc = pluma_document_loader_get_document (async->loader);
    mount_operation = _pluma_document_create_mount_operation (doc);

    async->tried_mount = TRUE;
    g_file_mount_enclosing_volume (async->loader->priv->gfile,
                                   G_MOUNT_MOUNT_NONE,
                                   mount_operation,
                                   async->cancellable,
                                   (GAsyncReadyCallback) mount_ready_callback,
                                   async);

    g_object_unref (mount_operation);
}

static void
async_read_ready_callback (GObject      *source,
                           GAsyncResult *res,
                           AsyncData    *async)
{
    GError *error = NULL;
    PlumaDocumentLoader *loader;

    pluma_debug (DEBUG_LOADER);

    /* manual check for cancelled state */
    if (g_cancellable_is_cancelled (async->cancellable))
    {
        async_data_free (async);
        return;
    }

    loader = async->loader;

    loader->priv->stream = G_INPUT_STREAM (g_file_read_finish (loader->priv->gfile,
                                           res, &error));

    if (!loader->priv->stream)
    {
        if (error->code == G_IO_ERROR_NOT_MOUNTED && !async->tried_mount)
        {
            recover_not_mounted (async);
            g_error_free (error);
            return;
        }

        /* Propagate error */
        g_propagate_error (&loader->priv->error, error);
        pluma_document_loader_loading (loader,
                                       TRUE,
                                       loader->priv->error);

        async_data_free (async);
        return;
    }

    /* get the file info: note we cannot use
     * g_file_input_stream_query_info_async since it is not able to get the
     * content type etc, beside it is not supported by gvfs.
     * Using the file instead of the stream is slightly racy, but for
     * loading this is not too bad...
     */
    g_file_query_info_async (loader->priv->gfile,
                             REMOTE_QUERY_ATTRIBUTES,
                             G_FILE_QUERY_INFO_NONE,
                             G_PRIORITY_HIGH,
                             async->cancellable,
                             (GAsyncReadyCallback) query_info_cb,
                             async);
}

static void
open_async_read (AsyncData *async)
{
    g_file_read_async (async->loader->priv->gfile,
                       G_PRIORITY_HIGH,
                       async->cancellable,
                       (GAsyncReadyCallback) async_read_ready_callback,
                       async);
}

void
pluma_document_loader_loading (PlumaDocumentLoader *loader,
                               gboolean             completed,
                               GError              *error)
{
    /* the object will be unrefed in the callback of the loading signal
     * (when completed == TRUE), so we need to prevent finalization.
     */
    if (completed)
    {
        g_object_ref (loader);
    }

    g_signal_emit (loader, signals[LOADING], 0, completed, error);

    if (completed)
    {
        if (error == NULL)
            pluma_debug_message (DEBUG_LOADER, "load completed");
        else
            pluma_debug_message (DEBUG_LOADER, "load failed");

        g_object_unref (loader);
    }
}

/* If enconding == NULL, the encoding will be autodetected */
void
pluma_document_loader_load (PlumaDocumentLoader *loader)
{
    AsyncData *async;

    pluma_debug (DEBUG_LOADER);

    g_return_if_fail (PLUMA_IS_DOCUMENT_LOADER (loader));

    /* the loader can be used just once, then it must be thrown away */
    g_return_if_fail (loader->priv->used == FALSE);
    loader->priv->used = TRUE;

    /* make sure no load operation is currently running */
    g_return_if_fail (loader->priv->cancellable == NULL);

    loader->priv->gfile = g_file_new_for_uri (loader->priv->uri);

    /* loading start */
    pluma_document_loader_loading (PLUMA_DOCUMENT_LOADER (loader),
                                   FALSE,
                                   NULL);

    loader->priv->cancellable = g_cancellable_new ();
    async = async_data_new (loader);

    open_async_read (async);
}

gboolean
pluma_document_loader_cancel (PlumaDocumentLoader *loader)
{
    pluma_debug (DEBUG_LOADER);

    g_return_val_if_fail (PLUMA_IS_DOCUMENT_LOADER (loader), FALSE);

    if (loader->priv->cancellable == NULL)
        return FALSE;

    g_cancellable_cancel (loader->priv->cancellable);

    g_set_error (&loader->priv->error,
                 G_IO_ERROR,
                 G_IO_ERROR_CANCELLED,
                 "Operation cancelled");

    remote_load_completed_or_failed (loader, NULL);

    return TRUE;
}

PlumaDocument *
pluma_document_loader_get_document (PlumaDocumentLoader *loader)
{
    g_return_val_if_fail (PLUMA_IS_DOCUMENT_LOADER (loader), NULL);

    return loader->priv->document;
}

/* Returns STDIN_URI if loading from stdin */
const gchar *
pluma_document_loader_get_uri (PlumaDocumentLoader *loader)
{
    g_return_val_if_fail (PLUMA_IS_DOCUMENT_LOADER (loader), NULL);

    return loader->priv->uri;
}

goffset
pluma_document_loader_get_bytes_read (PlumaDocumentLoader *loader)
{
    g_return_val_if_fail (PLUMA_IS_DOCUMENT_LOADER (loader), 0);

    return loader->priv->bytes_read;
}

const PlumaEncoding *
pluma_document_loader_get_encoding (PlumaDocumentLoader *loader)
{
    g_return_val_if_fail (PLUMA_IS_DOCUMENT_LOADER (loader), NULL);

    if (loader->priv->encoding != NULL)
        return loader->priv->encoding;

    g_return_val_if_fail (loader->priv->auto_detected_encoding != NULL,
                          pluma_encoding_get_current ());

    return loader->priv->auto_detected_encoding;
}

PlumaDocumentNewlineType
pluma_document_loader_get_newline_type (PlumaDocumentLoader *loader)
{
    g_return_val_if_fail (PLUMA_IS_DOCUMENT_LOADER (loader),
                          PLUMA_DOCUMENT_NEWLINE_TYPE_LF);

    return loader->priv->auto_detected_newline_type;
}

GFileInfo *
pluma_document_loader_get_info (PlumaDocumentLoader *loader)
{
    g_return_val_if_fail (PLUMA_IS_DOCUMENT_LOADER (loader), NULL);

    return loader->priv->info;
}
