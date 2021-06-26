/*
 * pluma-document-saver.c
 * This file is part of pluma
 *
 * Copyright (C) 2005-2006 - Paolo Borelli and Paolo Maggi
 * Copyright (C) 2007 - Paolo Borelli, Paolo Maggi, Steve Frécinaux
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
 * Modified by the pluma Team, 2005-2006. See the AUTHORS file for a
 * list of people on the pluma Team.
 * See the ChangeLog files for a list of changes.
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <glib/gi18n.h>
#include <glib.h>
#include <gio/gio.h>
#include <string.h>

#include "pluma-document-saver.h"
#include "pluma-document-input-stream.h"
#include "pluma-debug.h"
#include "pluma-utils.h"
#include "pluma-enum-types.h"
#include "pluma-settings.h"

#define WRITE_CHUNK_SIZE 8192

/* Signals */

enum {
    SAVING,
    LAST_SIGNAL
};

static guint signals[LAST_SIGNAL] = { 0 };

/* Properties */

enum {
    PROP_0,
    PROP_DOCUMENT,
    PROP_URI,
    PROP_ENCODING,
    PROP_NEWLINE_TYPE,
    PROP_FLAGS
};

typedef struct
{
    PlumaDocumentSaver    *saver;
    gchar                  buffer[WRITE_CHUNK_SIZE];
    GCancellable          *cancellable;
    gboolean               tried_mount;
    gssize                 written;
    gssize                 read;
    GError                *error;
} AsyncData;

#define REMOTE_QUERY_ATTRIBUTES G_FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE "," \
                                G_FILE_ATTRIBUTE_TIME_MODIFIED "," \
                                G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC

static void check_modified_async (AsyncData *async);

struct _PlumaDocumentSaverPrivate
{
    GSettings                *editor_settings;

    GFileInfo                *info;
    PlumaDocument            *document;
    gboolean                  used;

    gchar                    *uri;
    const PlumaEncoding      *encoding;
    PlumaDocumentNewlineType  newline_type;

    PlumaDocumentSaveFlags    flags;

    gboolean                  keep_backup;

    gint64                    old_mtime;

    goffset                   size;
    goffset                   bytes_written;

    GFile                    *gfile;
    GCancellable             *cancellable;
    GOutputStream            *stream;
    GInputStream             *input;

    GError                   *error;
};

G_DEFINE_TYPE_WITH_PRIVATE (PlumaDocumentSaver, pluma_document_saver, G_TYPE_OBJECT)

static void
pluma_document_saver_set_property (GObject      *object,
                                   guint         prop_id,
                                   const GValue *value,
                                   GParamSpec   *pspec)
{
    PlumaDocumentSaver *saver = PLUMA_DOCUMENT_SAVER (object);

    switch (prop_id)
    {
        case PROP_DOCUMENT:
            g_return_if_fail (saver->priv->document == NULL);
            saver->priv->document = g_value_get_object (value);
            break;
        case PROP_URI:
            g_return_if_fail (saver->priv->uri == NULL);
            saver->priv->uri = g_value_dup_string (value);
            break;
        case PROP_ENCODING:
            g_return_if_fail (saver->priv->encoding == NULL);
            saver->priv->encoding = g_value_get_boxed (value);
            break;
        case PROP_NEWLINE_TYPE:
            saver->priv->newline_type = g_value_get_enum (value);
            break;
        case PROP_FLAGS:
            saver->priv->flags = g_value_get_flags (value);
            break;
        default:
            G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
            break;
    }
}

static void
pluma_document_saver_get_property (GObject    *object,
                                   guint       prop_id,
                                   GValue     *value,
                                   GParamSpec *pspec)
{
    PlumaDocumentSaver *saver = PLUMA_DOCUMENT_SAVER (object);

    switch (prop_id)
    {
        case PROP_DOCUMENT:
            g_value_set_object (value, saver->priv->document);
            break;
        case PROP_URI:
            g_value_set_string (value, saver->priv->uri);
            break;
        case PROP_ENCODING:
            g_value_set_boxed (value, saver->priv->encoding);
            break;
        case PROP_NEWLINE_TYPE:
            g_value_set_enum (value, saver->priv->newline_type);
            break;
        case PROP_FLAGS:
            g_value_set_flags (value, saver->priv->flags);
            break;
        default:
            G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
            break;
    }
}

static void
pluma_document_saver_finalize (GObject *object)
{
    PlumaDocumentSaverPrivate *priv = pluma_document_saver_get_instance_private (PLUMA_DOCUMENT_SAVER(object));

    g_free (priv->uri);

    G_OBJECT_CLASS (pluma_document_saver_parent_class)->finalize (object);
}

static void
pluma_document_saver_dispose (GObject *object)
{
    PlumaDocumentSaverPrivate *priv = pluma_document_saver_get_instance_private (PLUMA_DOCUMENT_SAVER(object));

    if (priv->cancellable != NULL)
    {
        g_cancellable_cancel (priv->cancellable);
        g_object_unref (priv->cancellable);
        priv->cancellable = NULL;
    }

    if (priv->gfile != NULL)
    {
        g_object_unref (priv->gfile);
        priv->gfile = NULL;
    }

    g_clear_error (&priv->error);

    if (priv->stream != NULL)
    {
        g_object_unref (priv->stream);
        priv->stream = NULL;
    }

    if (priv->info != NULL)
    {
        g_object_unref (priv->info);
        priv->info = NULL;
    }

    g_clear_object (&priv->editor_settings);

    G_OBJECT_CLASS (pluma_document_saver_parent_class)->dispose (object);
}

static AsyncData *
async_data_new (PlumaDocumentSaver *gvsaver)
{
    AsyncData *async;

    async = g_slice_new (AsyncData);
    async->saver = gvsaver;
    async->cancellable = g_object_ref (gvsaver->priv->cancellable);

    async->tried_mount = FALSE;
    async->written = 0;
    async->read = 0;

    async->error = NULL;

    return async;
}

static void
async_data_free (AsyncData *async)
{
    g_object_unref (async->cancellable);

    if (async->error)
    {
        g_error_free (async->error);
    }

    g_slice_free (AsyncData, async);
}

static void
pluma_document_saver_class_init (PlumaDocumentSaverClass *klass)
{
    GObjectClass *object_class = G_OBJECT_CLASS (klass);

    object_class->dispose = pluma_document_saver_dispose;
    object_class->finalize = pluma_document_saver_finalize;
    object_class->set_property = pluma_document_saver_set_property;
    object_class->get_property = pluma_document_saver_get_property;

    g_object_class_install_property (object_class,
                                     PROP_DOCUMENT,
                                     g_param_spec_object ("document",
                                                          "Document",
                                                          "The PlumaDocument this PlumaDocumentSaver is associated with",
                                                          PLUMA_TYPE_DOCUMENT,
                                                          G_PARAM_READWRITE |
                                                          G_PARAM_CONSTRUCT_ONLY |
                                                          G_PARAM_STATIC_STRINGS));

    g_object_class_install_property (object_class,
                                     PROP_URI,
                                     g_param_spec_string ("uri",
                                                          "URI",
                                                          "The URI this PlumaDocumentSaver saves the document to",
                                                          "",
                                                          G_PARAM_READWRITE |
                                                          G_PARAM_CONSTRUCT_ONLY |
                                                          G_PARAM_STATIC_STRINGS));

    g_object_class_install_property (object_class,
                                     PROP_ENCODING,
                                     g_param_spec_boxed ("encoding",
                                                         "URI",
                                                         "The encoding of the saved file",
                                                         PLUMA_TYPE_ENCODING,
                                                         G_PARAM_READWRITE |
                                                         G_PARAM_CONSTRUCT_ONLY |
                                                         G_PARAM_STATIC_STRINGS));

    g_object_class_install_property (object_class,
                                     PROP_NEWLINE_TYPE,
                                     g_param_spec_enum ("newline-type",
                                                        "Newline type",
                                                         "The accepted types of line ending",
                                                         PLUMA_TYPE_DOCUMENT_NEWLINE_TYPE,
                                                         PLUMA_DOCUMENT_NEWLINE_TYPE_LF,
                                                         G_PARAM_READWRITE |
                                                         G_PARAM_STATIC_NAME |
                                                         G_PARAM_STATIC_BLURB |
                                                         G_PARAM_CONSTRUCT_ONLY));

    g_object_class_install_property (object_class,
                                     PROP_FLAGS,
                                     g_param_spec_flags ("flags",
                                                         "Flags",
                                                         "The flags for the saving operation",
                                                         PLUMA_TYPE_DOCUMENT_SAVE_FLAGS,
                                                         0,
                                                         G_PARAM_READWRITE |
                                                         G_PARAM_CONSTRUCT_ONLY));

    signals[SAVING] =
        g_signal_new ("saving",
                      G_OBJECT_CLASS_TYPE (object_class),
                      G_SIGNAL_RUN_LAST,
                      G_STRUCT_OFFSET (PlumaDocumentSaverClass, saving),
                      NULL, NULL, NULL,
                      G_TYPE_NONE,
                      2,
                      G_TYPE_BOOLEAN,
                      G_TYPE_POINTER);
}

static void
pluma_document_saver_init (PlumaDocumentSaver *saver)
{
    saver->priv = pluma_document_saver_get_instance_private (saver);

    saver->priv->cancellable = g_cancellable_new ();
    saver->priv->error = NULL;
    saver->priv->used = FALSE;
    saver->priv->editor_settings = g_settings_new (PLUMA_SCHEMA_ID);
}

PlumaDocumentSaver *
pluma_document_saver_new (PlumaDocument           *doc,
                          const gchar             *uri,
                          const PlumaEncoding     *encoding,
                          PlumaDocumentNewlineType newline_type,
                          PlumaDocumentSaveFlags   flags)
{
    return PLUMA_DOCUMENT_SAVER (g_object_new (PLUMA_TYPE_DOCUMENT_SAVER,
                                 "document", doc,
                                 "uri", uri,
                                 "encoding", encoding,
                                 "newline_type", newline_type,
                                 "flags", flags,
                                 NULL));

}

static void
remote_save_completed_or_failed (PlumaDocumentSaver *gvsaver,
                                 AsyncData          *async)
{
    pluma_document_saver_saving (PLUMA_DOCUMENT_SAVER (gvsaver),
                                 TRUE,
                                 gvsaver->priv->error);

    if (async)
        async_data_free (async);
}

static void
async_failed (AsyncData *async,
              GError    *error)
{
    g_propagate_error (&async->saver->priv->error, error);
    remote_save_completed_or_failed (async->saver, async);
}

/* BEGIN NOTE:
 *
 * This fixes an issue in GOutputStream that applies the atomic replace
 * save strategy. The stream moves the written file to the original file
 * when the stream is closed. However, there is no way currently to tell
 * the stream that the save should be aborted (there could be a
 * conversion error). The patch explicitly closes the output stream
 * in all these cases with a GCancellable in the cancelled state, causing
 * the output stream to close, but not move the file. This makes use
 * of an implementation detail in the local  file stream and should be
 * properly fixed by adding the appropriate API in . Until then, at least
 * we prevent data corruption for now.
 *
 * Relevant bug reports:
 *
 * Bug 615110 - write file ignore encoding errors (pluma)
 * https://bugzilla.gnome.org/show_bug.cgi?id=615110
 *
 * Bug 602412 - g_file_replace does not restore original file when there is
 *              errors while writing (glib/)
 * https://bugzilla.gnome.org/show_bug.cgi?id=602412
 */
static void
cancel_output_stream_ready_cb (GOutputStream *stream,
                               GAsyncResult  *result,
                               AsyncData     *async)
{
    GError *error;

    g_output_stream_close_finish (stream, result, NULL);

    /* check cancelled state manually */
    if (g_cancellable_is_cancelled (async->cancellable) || async->error == NULL)
    {
        async_data_free (async);
        return;
    }

    error = async->error;
    async->error = NULL;

    async_failed (async, error);
}

static void
cancel_output_stream (AsyncData *async)
{
    GCancellable *cancellable;

    pluma_debug_message (DEBUG_SAVER, "Cancel output stream");

    cancellable = g_cancellable_new ();
    g_cancellable_cancel (cancellable);

    g_output_stream_close_async (async->saver->priv->stream,
                                 G_PRIORITY_HIGH,
                                 cancellable,
                                 (GAsyncReadyCallback)cancel_output_stream_ready_cb,
                                 async);

    g_object_unref (cancellable);
}

static void
cancel_output_stream_and_fail (AsyncData *async,
                               GError    *error)
{

    pluma_debug_message (DEBUG_SAVER, "Cancel output stream and fail");

    g_propagate_error (&async->error, error);
    cancel_output_stream (async);
}

/*
 * END NOTE
 */

static void
remote_get_info_cb (GFile        *source,
                    GAsyncResult *res,
                    AsyncData    *async)
{
    PlumaDocumentSaver *saver;
    GFileInfo *info;
    GError *error = NULL;

    pluma_debug (DEBUG_SAVER);

    /* check cancelled state manually */
    if (g_cancellable_is_cancelled (async->cancellable))
    {
        async_data_free (async);
        return;
    }

    saver = async->saver;

    pluma_debug_message (DEBUG_SAVER, "Finished query info on file");
    info = g_file_query_info_finish (source, res, &error);

    if (info != NULL)
    {
        if (saver->priv->info != NULL)
            g_object_unref (saver->priv->info);

        saver->priv->info = info;
    }
    else
    {
        pluma_debug_message (DEBUG_SAVER, "Query info failed: %s", error->message);
        g_propagate_error (&saver->priv->error, error);
    }

    remote_save_completed_or_failed (saver, async);
}

static void
close_async_ready_get_info_cb (GOutputStream *stream,
                               GAsyncResult  *res,
                               AsyncData     *async)
{
    GError *error = NULL;

    pluma_debug (DEBUG_SAVER);

    /* check cancelled state manually */
    if (g_cancellable_is_cancelled (async->cancellable))
    {
        async_data_free (async);
        return;
    }

    pluma_debug_message (DEBUG_SAVER, "Finished closing stream");

    if (!g_output_stream_close_finish (stream, res, &error))
    {
        pluma_debug_message (DEBUG_SAVER, "Closing stream error: %s", error->message);

        async_failed (async, error);
        return;
    }

    /* get the file info: note we cannot use
     * g_file_output_stream_query_info_async since it is not able to get the
     * content type etc, beside it is not supported by gvfs.
     * I'm not sure this is actually necessary, can't we just use
     * g_content_type_guess (since we have the file name and the data)
     */
    pluma_debug_message (DEBUG_SAVER, "Query info on file");
    g_file_query_info_async (async->saver->priv->gfile,
                             REMOTE_QUERY_ATTRIBUTES,
                             G_FILE_QUERY_INFO_NONE,
                             G_PRIORITY_HIGH,
                             async->cancellable,
                             (GAsyncReadyCallback) remote_get_info_cb,
                             async);
}

static void
write_complete (AsyncData *async)
{
    GError *error = NULL;

    /* first we close the input stream */
    pluma_debug_message (DEBUG_SAVER, "Close input stream");
    if (!g_input_stream_close (async->saver->priv->input,
                               async->cancellable, &error))
    {
        pluma_debug_message (DEBUG_SAVER, "Closing input stream error: %s", error->message);
        cancel_output_stream_and_fail (async, error);
        return;
    }

    /* now we close the output stream */
    pluma_debug_message (DEBUG_SAVER, "Close output stream");
    g_output_stream_close_async (async->saver->priv->stream,
                                 G_PRIORITY_HIGH,
                                 async->cancellable,
                                 (GAsyncReadyCallback)close_async_ready_get_info_cb,
                                 async);
}

/* prototype, because they call each other... isn't C lovely */
static void read_file_chunk (AsyncData *async);
static void write_file_chunk (AsyncData *async);

static void
async_write_cb (GOutputStream *stream,
                GAsyncResult  *res,
                AsyncData     *async)
{
    PlumaDocumentSaver *saver;
    gssize bytes_written;
    GError *error = NULL;

    pluma_debug (DEBUG_SAVER);

    /* Check cancelled state manually */
    if (g_cancellable_is_cancelled (async->cancellable))
    {
        cancel_output_stream (async);
        return;
    }

    bytes_written = g_output_stream_write_finish (stream, res, &error);

    pluma_debug_message (DEBUG_SAVER, "Written: %" G_GSSIZE_FORMAT, bytes_written);

    if (bytes_written == -1)
    {
        pluma_debug_message (DEBUG_SAVER, "Write error: %s", error->message);
        cancel_output_stream_and_fail (async, error);
        return;
    }

    saver = async->saver;
    async->written += bytes_written;

    /* write again */
    if (async->written != async->read)
    {
        write_file_chunk (async);
        return;
    }

    /* note that this signal blocks the write... check if it isn't
     * a performance problem
     */
    pluma_document_saver_saving (saver, FALSE, NULL);

    read_file_chunk (async);
}

static void
write_file_chunk (AsyncData *async)
{
    PlumaDocumentSaver *saver;

    pluma_debug (DEBUG_SAVER);

    saver = async->saver;

    g_output_stream_write_async (G_OUTPUT_STREAM (saver->priv->stream),
                                 async->buffer + async->written,
                                 async->read - async->written,
                                 G_PRIORITY_HIGH,
                                 async->cancellable,
                                 (GAsyncReadyCallback) async_write_cb,
                                 async);
}

static void
read_file_chunk (AsyncData *async)
{
    PlumaDocumentSaver *saver;
    PlumaDocumentInputStream *dstream;
    GError *error = NULL;

    pluma_debug (DEBUG_SAVER);

    saver = async->saver;
    async->written = 0;

    /* we use sync methods on doc stream since it is in memory. Using async
       would be racy and we can endup with invalidated iters */
    async->read = g_input_stream_read (saver->priv->input,
                                       async->buffer,
                                       WRITE_CHUNK_SIZE,
                                       async->cancellable,
                                       &error);

    if (error != NULL)
    {
        cancel_output_stream_and_fail (async, error);
        return;
    }

    /* Check if we finished reading and writing */
    if (async->read == 0)
    {
        write_complete (async);
        return;
    }

    /* Get how many chars have been read */
    dstream = PLUMA_DOCUMENT_INPUT_STREAM (saver->priv->input);
    saver->priv->bytes_written = pluma_document_input_stream_tell (dstream);

    write_file_chunk (async);
}

static void
async_replace_ready_callback (GFile        *source,
                              GAsyncResult *res,
                              AsyncData    *async)
{
    PlumaDocumentSaver *saver;
    GCharsetConverter *converter;
    GFileOutputStream *file_stream;
    GError *error = NULL;

    pluma_debug (DEBUG_SAVER);

    /* Check cancelled state manually */
    if (g_cancellable_is_cancelled (async->cancellable))
    {
        async_data_free (async);
        return;
    }

    saver = async->saver;
    file_stream = g_file_replace_finish (source, res, &error);

    /* handle any error that might occur */
    if (!file_stream)
    {
        pluma_debug_message (DEBUG_SAVER, "Opening file failed: %s", error->message);
        async_failed (async, error);
        return;
    }

    /* FIXME: manage converter error? */
    pluma_debug_message (DEBUG_SAVER, "Encoding charset: %s",
                 pluma_encoding_get_charset (saver->priv->encoding));

    if (saver->priv->encoding != pluma_encoding_get_utf8 ())
    {
        converter = g_charset_converter_new (pluma_encoding_get_charset (saver->priv->encoding),
                                             "UTF-8",
                                             NULL);
        saver->priv->stream = g_converter_output_stream_new (G_OUTPUT_STREAM (file_stream),
                                                             G_CONVERTER (converter));

        g_object_unref (file_stream);
        g_object_unref (converter);
    }
    else
    {
        saver->priv->stream = G_OUTPUT_STREAM (file_stream);
    }

    saver->priv->input = pluma_document_input_stream_new (GTK_TEXT_BUFFER (saver->priv->document),
                                                          saver->priv->newline_type);

    saver->priv->size = pluma_document_input_stream_get_total_size (PLUMA_DOCUMENT_INPUT_STREAM (saver->priv->input));

    read_file_chunk (async);
}

static void
begin_write (AsyncData *async)
{
    PlumaDocumentSaver *saver;
    gboolean backup;

    pluma_debug_message (DEBUG_SAVER, "Start replacing file contents");

    /* For remote files we simply use g_file_replace_async. There is no
     * backup as of yet
     */
    saver = async->saver;

    /* Do not make backups for remote files so they do not clutter remote systems */
    backup = (saver->priv->keep_backup && pluma_document_is_local (saver->priv->document));

    pluma_debug_message (DEBUG_SAVER, "File contents size: %" G_GINT64_FORMAT, saver->priv->size);
    pluma_debug_message (DEBUG_SAVER, "Calling replace_async");
    pluma_debug_message (DEBUG_SAVER, backup ? "Keep backup" : "Discard backup");

    g_file_replace_async (saver->priv->gfile,
                          NULL,
                          backup,
                          G_FILE_CREATE_NONE,
                          G_PRIORITY_HIGH,
                          async->cancellable,
                          (GAsyncReadyCallback) async_replace_ready_callback,
                          async);
}

static void
mount_ready_callback (GFile        *file,
                      GAsyncResult *res,
                      AsyncData    *async)
{
    GError *error = NULL;
    gboolean mounted;

    pluma_debug (DEBUG_SAVER);

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
        /* try again to get the modified state */
        check_modified_async (async);
    }
}

static void
recover_not_mounted (AsyncData *async)
{
    PlumaDocument *doc;
    GMountOperation *mount_operation;

    pluma_debug (DEBUG_LOADER);

    doc = pluma_document_saver_get_document (async->saver);
    mount_operation = _pluma_document_create_mount_operation (doc);

    async->tried_mount = TRUE;
    g_file_mount_enclosing_volume (async->saver->priv->gfile,
                                   G_MOUNT_MOUNT_NONE,
                                   mount_operation,
                                   async->cancellable,
                                   (GAsyncReadyCallback) mount_ready_callback,
                                   async);

    g_object_unref (mount_operation);
}

static void
check_modification_callback (GFile        *source,
                             GAsyncResult *res,
                             AsyncData    *async)
{
    PlumaDocumentSaver *saver;
    GError *error = NULL;
    GFileInfo *info;

    pluma_debug (DEBUG_SAVER);

    /* manually check cancelled state */
    if (g_cancellable_is_cancelled (async->cancellable))
    {
        async_data_free (async);
        return;
    }

    saver = async->saver;
    info = g_file_query_info_finish (source, res, &error);
    if (info == NULL)
    {
        if (error->code == G_IO_ERROR_NOT_MOUNTED && !async->tried_mount)
        {
            recover_not_mounted (async);
            g_error_free (error);
            return;
        }

        /* it's perfectly fine if the file doesn't exist yet */
        if (error->code != G_IO_ERROR_NOT_FOUND)
        {
            pluma_debug_message (DEBUG_SAVER, "Error getting modification: %s", error->message);

            async_failed (async, error);
            return;
        }
    }

    /* check if the mtime is > what we know about it (if we have it) */
    if (info != NULL && g_file_info_has_attribute (info, G_FILE_ATTRIBUTE_TIME_MODIFIED))
    {
        guint64 mtime;
        gint64 old_mtime;

        mtime = g_file_info_get_attribute_uint64 (info,
                                                  G_FILE_ATTRIBUTE_TIME_MODIFIED) * G_USEC_PER_SEC;
        if (g_file_info_has_attribute (info,
                                       G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC))
        {
            guint32 usec = g_file_info_get_attribute_uint32 (info,
                                                             G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC);
            mtime += (guint64) usec;
        }

        old_mtime = saver->priv->old_mtime;

         if ((old_mtime > 0 || ((gint64) mtime) > 0) && (((gint64) mtime) != old_mtime) &&
            (saver->priv->flags & PLUMA_DOCUMENT_SAVE_IGNORE_MTIME) == 0)
        {
            pluma_debug_message (DEBUG_SAVER, "File is externally modified");
            g_set_error (&saver->priv->error,
                         PLUMA_DOCUMENT_ERROR,
                         PLUMA_DOCUMENT_ERROR_EXTERNALLY_MODIFIED,
                         "Externally modified");

            remote_save_completed_or_failed (saver, async);
            g_object_unref (info);

            return;
        }
    }

    if (info != NULL)
        g_object_unref (info);

    /* modification check passed, start write */
    begin_write (async);
}

static void
check_modified_async (AsyncData *async)
{
    pluma_debug_message (DEBUG_SAVER, "Check externally modified");

    g_file_query_info_async (async->saver->priv->gfile,
                             G_FILE_ATTRIBUTE_TIME_MODIFIED "," G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC,
                             G_FILE_QUERY_INFO_NONE,
                             G_PRIORITY_HIGH,
                             async->cancellable,
                             (GAsyncReadyCallback) check_modification_callback,
                             async);
}

static gboolean
save_remote_file_real (PlumaDocumentSaver *saver)
{
    AsyncData *async;

    pluma_debug_message (DEBUG_SAVER, "Starting  save");

    /* First find out if the file is modified externally. This requires
     * a stat, but I don't think we can do this any other way
     */
    async = async_data_new (saver);

    check_modified_async (async);

    /* return false to stop timeout */
    return FALSE;
}

void
pluma_document_saver_save (PlumaDocumentSaver     *saver,
                           gint64                 *old_mtime)
{
    pluma_debug (DEBUG_SAVER);

    g_return_if_fail (PLUMA_IS_DOCUMENT_SAVER (saver));
    g_return_if_fail (saver->priv->uri != NULL && strlen (saver->priv->uri) > 0);

    g_return_if_fail (saver->priv->used == FALSE);
    saver->priv->used = TRUE;

    /* CHECK:
     * - sanity check a max len for the uri?
     * report async (in an idle handler) or sync (bool ret)
     * async is extra work here, sync is special casing in the caller
     */

    /* never keep backup of autosaves */
    if ((saver->priv->flags & PLUMA_DOCUMENT_SAVE_PRESERVE_BACKUP) != 0)
        saver->priv->keep_backup = FALSE;
    else
        saver->priv->keep_backup = g_settings_get_boolean (saver->priv->editor_settings,
                                                           PLUMA_SETTINGS_CREATE_BACKUP_COPY);

    saver->priv->old_mtime = *old_mtime;
    saver->priv->gfile = g_file_new_for_uri (saver->priv->uri);

    /* saving start */
    pluma_document_saver_saving (saver, FALSE, NULL);

    g_timeout_add_full (G_PRIORITY_HIGH,
                        0,
                        (GSourceFunc) save_remote_file_real,
                        saver,
                        NULL);
}

void
pluma_document_saver_saving (PlumaDocumentSaver *saver,
                             gboolean            completed,
                             GError             *error)
{
    /* the object will be unrefed in the callback of the saving
     * signal, so we need to prevent finalization.
     */
    if (completed)
    {
        g_object_ref (saver);
    }

    g_signal_emit (saver, signals[SAVING], 0, completed, error);

    if (completed)
    {
        if (error == NULL)
            pluma_debug_message (DEBUG_SAVER, "save completed");
        else
            pluma_debug_message (DEBUG_SAVER, "save failed");

        g_object_unref (saver);
    }
}

PlumaDocument *
pluma_document_saver_get_document (PlumaDocumentSaver *saver)
{
    g_return_val_if_fail (PLUMA_IS_DOCUMENT_SAVER (saver), NULL);

    return saver->priv->document;
}

const gchar *
pluma_document_saver_get_uri (PlumaDocumentSaver *saver)
{
    g_return_val_if_fail (PLUMA_IS_DOCUMENT_SAVER (saver), NULL);

    return saver->priv->uri;
}

/* Returns 0 if file size is unknown */
goffset
pluma_document_saver_get_file_size (PlumaDocumentSaver *saver)
{
    g_return_val_if_fail (PLUMA_IS_DOCUMENT_SAVER (saver), 0);

    return saver->priv->size;
}

goffset
pluma_document_saver_get_bytes_written (PlumaDocumentSaver *saver)
{
    g_return_val_if_fail (PLUMA_IS_DOCUMENT_SAVER (saver), 0);

    return saver->priv->bytes_written;
}

GFileInfo *
pluma_document_saver_get_info (PlumaDocumentSaver *saver)
{
    g_return_val_if_fail (PLUMA_IS_DOCUMENT_SAVER (saver), NULL);

    return saver->priv->info;
}
