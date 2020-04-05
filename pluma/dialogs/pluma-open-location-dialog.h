/*
 * pluma-open-location-dialog.h
 * This file is part of pluma
 *
 * Copyright (C) 2001-2005 Paolo Maggi
 * Copyright (C) 2020 MATE Developers
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
 * Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307, USA.
 */


#ifndef __PLUMA_OPEN_LOCATION_DIALOG_H__
#define __PLUMA_OPEN_LOCATION_DIALOG_H__

#include <gio/gio.h>
#include <gtk/gtk.h>
#include <pluma/pluma-encodings.h>

G_BEGIN_DECLS

/*
 * Type checking and casting macros
 */
#define PLUMA_TYPE_OPEN_LOCATION_DIALOG              (pluma_open_location_dialog_get_type())
#define PLUMA_OPEN_LOCATION_DIALOG(obj)              (G_TYPE_CHECK_INSTANCE_CAST((obj), PLUMA_TYPE_OPEN_LOCATION_DIALOG, PlumaOpenLocationDialog))
#define PLUMA_OPEN_LOCATION_DIALOG_CONST(obj)        (G_TYPE_CHECK_INSTANCE_CAST((obj), PLUMA_TYPE_OPEN_LOCATION_DIALOG, PlumaOpenLocationDialog const))
#define PLUMA_OPEN_LOCATION_DIALOG_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST((klass), PLUMA_TYPE_OPEN_LOCATION_DIALOG, PlumaOpenLocationDialogClass))
#define PLUMA_IS_OPEN_LOCATION_DIALOG(obj)           (G_TYPE_CHECK_INSTANCE_TYPE((obj), PLUMA_TYPE_OPEN_LOCATION_DIALOG))
#define PLUMA_IS_OPEN_LOCATION_DIALOG_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PLUMA_TYPE_OPEN_LOCATION_DIALOG))
#define PLUMA_OPEN_LOCATION_DIALOG_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS((obj), PLUMA_TYPE_OPEN_LOCATION_DIALOG, PlumaOpenLocationDialogClass))

/* Private structure type */
typedef struct _PlumaOpenLocationDialogPrivate PlumaOpenLocationDialogPrivate;

/*
 * Main object structure
 */
typedef struct _PlumaOpenLocationDialog PlumaOpenLocationDialog;

struct _PlumaOpenLocationDialog
{
	GtkDialog dialog;

	/*< private > */
	PlumaOpenLocationDialogPrivate *priv;
};

/*
 * Class definition
 */
typedef struct _PlumaOpenLocationDialogClass PlumaOpenLocationDialogClass;

struct _PlumaOpenLocationDialogClass
{
	GtkDialogClass parent_class;
};

/*
 * Public methods
 */
GType pluma_open_location_dialog_get_type(void);

GtkWidget *pluma_open_location_dialog_new(GtkWindow *parent);

GFile *pluma_open_location_dialog_get_location(PlumaOpenLocationDialog *dlg);

const PlumaEncoding	*pluma_open_location_dialog_get_encoding(PlumaOpenLocationDialog *dlg);

/*
 * The widget automatically runs the help viewer when the Help button is pressed,
 * so there is no need to catch the GTK_RESPONSE_HELP response.
 *
 * GTK_RESPONSE_OK response is emitted when the "Open" button is pressed.
 */

G_END_DECLS

#endif  /* __PLUMA_OPEN_LOCATION_DIALOG_H__  */
