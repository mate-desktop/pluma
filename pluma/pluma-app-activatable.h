/*
 * pluma-app-activatable.h
 * This file is part of pluma
 *
 * Copyright (C) 2010 - Steve Frécinaux
 * Copyright (C) 2010 - Jesse van den Kieboom
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Library General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Library General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see https://www.gnu.org/licenses/.
 */

#ifndef __PLUMA_APP_ACTIVATABLE_H__
#define __PLUMA_APP_ACTIVATABLE_H__

#include <glib-object.h>

G_BEGIN_DECLS

/*
 * Type checking and casting macros
 */
#define PLUMA_TYPE_APP_ACTIVATABLE           (pluma_app_activatable_get_type ())
#define PLUMA_APP_ACTIVATABLE(obj)           (G_TYPE_CHECK_INSTANCE_CAST ((obj),    PLUMA_TYPE_APP_ACTIVATABLE, PlumaAppActivatable))
#define PLUMA_APP_ACTIVATABLE_IFACE(obj)     (G_TYPE_CHECK_CLASS_CAST ((obj),       PLUMA_TYPE_APP_ACTIVATABLE, PlumaAppActivatableInterface))
#define PLUMA_IS_APP_ACTIVATABLE(obj)        (G_TYPE_CHECK_INSTANCE_TYPE ((obj),    PLUMA_TYPE_APP_ACTIVATABLE))
#define PLUMA_APP_ACTIVATABLE_GET_IFACE(obj) (G_TYPE_INSTANCE_GET_INTERFACE ((obj), PLUMA_TYPE_APP_ACTIVATABLE, PlumaAppActivatableInterface))

typedef struct _PlumaAppActivatable           PlumaAppActivatable; /* dummy typedef */
typedef struct _PlumaAppActivatableInterface  PlumaAppActivatableInterface;

struct _PlumaAppActivatableInterface
{
    GTypeInterface g_iface;

    /* Virtual public methods */
    void    (*activate)     (PlumaAppActivatable *activatable);
    void    (*deactivate)   (PlumaAppActivatable *activatable);
};

/*
 * Public methods
 */
GType    pluma_app_activatable_get_type     (void)  G_GNUC_CONST;

void     pluma_app_activatable_activate     (PlumaAppActivatable *activatable);
void     pluma_app_activatable_deactivate   (PlumaAppActivatable *activatable);

G_END_DECLS

#endif /* __PLUMA_APP_ACTIVATABLE_H__ */
