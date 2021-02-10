/*
 * pluma-docinfo-plugin.h
 *
 * Copyright (C) 2002-2005 Paolo Maggi
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
 *
 */

#ifndef __PLUMA_DOCINFO_PLUGIN_H__
#define __PLUMA_DOCINFO_PLUGIN_H__

#include <glib.h>
#include <glib-object.h>
#include <libpeas/peas-extension-base.h>
#include <libpeas/peas-object-module.h>

G_BEGIN_DECLS

#define PLUMA_TYPE_DOCINFO_PLUGIN		(pluma_docinfo_plugin_get_type ())
#define PLUMA_DOCINFO_PLUGIN(o)			(G_TYPE_CHECK_INSTANCE_CAST ((o), PLUMA_TYPE_DOCINFO_PLUGIN, PlumaDocinfoPlugin))
#define PLUMA_DOCINFO_PLUGIN_CLASS(k)		(G_TYPE_CHECK_CLASS_CAST((k), PLUMA_TYPE_DOCINFO_PLUGIN, PlumaDocinfoPluginClass))
#define PLUMA_IS_DOCINFO_PLUGIN(o)		(G_TYPE_CHECK_INSTANCE_TYPE ((o), PLUMA_TYPE_DOCINFO_PLUGIN))
#define PLUMA_IS_DOCINFO_PLUGIN_CLASS(k)	(G_TYPE_CHECK_CLASS_TYPE ((k), PLUMA_TYPE_DOCINFO_PLUGIN))
#define PLUMA_DOCINFO_PLUGIN_GET_CLASS(o)	(G_TYPE_INSTANCE_GET_CLASS ((o), PLUMA_TYPE_DOCINFO_PLUGIN, PlumaDocinfoPluginClass))

typedef struct _PlumaDocinfoPlugin	PlumaDocinfoPlugin;
typedef struct _PlumaDocinfoPluginPrivate	PlumaDocinfoPluginPrivate;
typedef struct _PlumaDocinfoPluginClass	PlumaDocinfoPluginClass;

struct _PlumaDocinfoPlugin
{
	PeasExtensionBase parent;

	/*< private >*/
	PlumaDocinfoPluginPrivate *priv;
};

struct _PlumaDocinfoPluginClass
{
	PeasExtensionBaseClass parent_class;
};

GType	pluma_docinfo_plugin_get_type		(void) G_GNUC_CONST;

G_MODULE_EXPORT void peas_register_types (PeasObjectModule *module);

G_END_DECLS

#endif /* __PLUMA_DOCINFO_PLUGIN_H__ */
