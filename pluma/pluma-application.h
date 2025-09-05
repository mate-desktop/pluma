/*
 * pluma-application.h
 * This file is part of pluma
 *
 * Copyright (C) 2025 MATE Developers
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

#ifndef __PLUMA_APPLICATION_H__
#define __PLUMA_APPLICATION_H__

#include <gtk/gtk.h>

G_BEGIN_DECLS

/*
 * Type checking and casting macros
 */
#define PLUMA_TYPE_APPLICATION              (pluma_application_get_type())
#define PLUMA_APPLICATION(obj)              (G_TYPE_CHECK_INSTANCE_CAST((obj), PLUMA_TYPE_APPLICATION, PlumaApplication))
#define PLUMA_APPLICATION_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST((klass), PLUMA_TYPE_APPLICATION, PlumaApplicationClass))
#define PLUMA_IS_APPLICATION(obj)           (G_TYPE_CHECK_INSTANCE_TYPE((obj), PLUMA_TYPE_APPLICATION))
#define PLUMA_IS_APPLICATION_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PLUMA_TYPE_APPLICATION))
#define PLUMA_APPLICATION_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS((obj), PLUMA_TYPE_APPLICATION, PlumaApplicationClass))

/* Private structure type */
typedef struct _PlumaApplicationPrivate PlumaApplicationPrivate;

/*
 * Main object structure
 */
typedef struct _PlumaApplication PlumaApplication;

struct _PlumaApplication
{
	GtkApplication parent_instance;

	/*< private > */
	PlumaApplicationPrivate *priv;
};

/*
 * Class definition
 */
typedef struct _PlumaApplicationClass PlumaApplicationClass;

struct _PlumaApplicationClass
{
	GtkApplicationClass parent_class;
};

/*
 * Public methods
 */
GType 		 pluma_application_get_type 		(void) G_GNUC_CONST;

PlumaApplication *pluma_application_new			(void);

void		 pluma_application_set_command_line_options (PlumaApplication *app,
							     gint line_pos,
							     const gchar *encoding,
							     gboolean new_window,
							     gboolean new_document,
							     GSList *file_list);

G_END_DECLS

#endif  /* __PLUMA_APPLICATION_H__  */
