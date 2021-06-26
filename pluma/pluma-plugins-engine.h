/*
 * pluma-plugins-engine.h
 * This file is part of pluma
 *
 * Copyright (C) 2002-2005 - Paolo Maggi
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
 * Modified by the pluma Team, 2002-2005. See the AUTHORS file for a
 * list of people on the pluma Team.
 * See the ChangeLog files for a list of changes.
 *
 * $Id$
 */

#ifndef __PLUMA_PLUGINS_ENGINE_H__
#define __PLUMA_PLUGINS_ENGINE_H__

#include <glib.h>
#include <libpeas/peas-engine.h>

G_BEGIN_DECLS

#define PLUMA_TYPE_PLUGINS_ENGINE              (pluma_plugins_engine_get_type ())
#define PLUMA_PLUGINS_ENGINE(obj)              (G_TYPE_CHECK_INSTANCE_CAST((obj), PLUMA_TYPE_PLUGINS_ENGINE, PlumaPluginsEngine))
#define PLUMA_PLUGINS_ENGINE_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST((klass), PLUMA_TYPE_PLUGINS_ENGINE, PlumaPluginsEngineClass))
#define PLUMA_IS_PLUGINS_ENGINE(obj)           (G_TYPE_CHECK_INSTANCE_TYPE((obj), PLUMA_TYPE_PLUGINS_ENGINE))
#define PLUMA_IS_PLUGINS_ENGINE_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PLUMA_TYPE_PLUGINS_ENGINE))
#define PLUMA_PLUGINS_ENGINE_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS((obj), PLUMA_TYPE_PLUGINS_ENGINE, PlumaPluginsEngineClass))

typedef struct _PlumaPluginsEngine		PlumaPluginsEngine;
typedef struct _PlumaPluginsEnginePrivate	PlumaPluginsEnginePrivate;

struct _PlumaPluginsEngine
{
	PeasEngine parent;
	PlumaPluginsEnginePrivate *priv;
};

typedef struct _PlumaPluginsEngineClass		PlumaPluginsEngineClass;

struct _PlumaPluginsEngineClass
{
	PeasEngineClass parent_class;
};

GType			 pluma_plugins_engine_get_type		(void) G_GNUC_CONST;

PlumaPluginsEngine	*pluma_plugins_engine_get_default	(void);

G_END_DECLS

#endif  /* __PLUMA_PLUGINS_ENGINE_H__ */
