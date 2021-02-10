/*
 * pluma-window-activatable.h
 * This file is part of pluma
 *
 * Copyright (C) 2010 - Steve Frécinaux
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU Library General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU Library General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
 */

#ifndef __PLUMA_WINDOW_ACTIVATABLE_H__
#define __PLUMA_WINDOW_ACTIVATABLE_H__

#include <glib-object.h>

G_BEGIN_DECLS

/*
 * Type checking and casting macros
 */
#define PLUMA_TYPE_WINDOW_ACTIVATABLE       (pluma_window_activatable_get_type ())
#define PLUMA_WINDOW_ACTIVATABLE(obj)       (G_TYPE_CHECK_INSTANCE_CAST ((obj), PLUMA_TYPE_WINDOW_ACTIVATABLE, PlumaWindowActivatable))
#define PLUMA_WINDOW_ACTIVATABLE_IFACE(obj) (G_TYPE_CHECK_CLASS_CAST ((obj), PLUMA_TYPE_WINDOW_ACTIVATABLE, PlumaWindowActivatableInterface))
#define PLUMA_IS_WINDOW_ACTIVATABLE(obj)    (G_TYPE_CHECK_INSTANCE_TYPE ((obj), PLUMA_TYPE_WINDOW_ACTIVATABLE))
#define PLUMA_WINDOW_ACTIVATABLE_GET_IFACE(obj) (G_TYPE_INSTANCE_GET_INTERFACE ((obj), PLUMA_TYPE_WINDOW_ACTIVATABLE, PlumaWindowActivatableInterface))

typedef struct _PlumaWindowActivatable           PlumaWindowActivatable; /* dummy typedef */
typedef struct _PlumaWindowActivatableInterface  PlumaWindowActivatableInterface;

struct _PlumaWindowActivatableInterface
{
    GTypeInterface g_iface;

    /* Virtual public methods */
    void    (*activate)     (PlumaWindowActivatable *activatable);
    void    (*deactivate)       (PlumaWindowActivatable *activatable);
    void    (*update_state)     (PlumaWindowActivatable *activatable);
};

/*
 * Public methods
 */
GType    pluma_window_activatable_get_type  (void)  G_GNUC_CONST;

void     pluma_window_activatable_activate  (PlumaWindowActivatable *activatable);
void     pluma_window_activatable_deactivate    (PlumaWindowActivatable *activatable);
void     pluma_window_activatable_update_state  (PlumaWindowActivatable *activatable);

G_END_DECLS

#endif /* __PLUMA_WINDOW_ACTIVATABLE_H__ */
