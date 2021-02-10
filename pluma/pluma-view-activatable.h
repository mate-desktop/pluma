/*
 * pluma-view-activatable.h
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

#ifndef __PLUMA_VIEW_ACTIVATABLE_H__
#define __PLUMA_VIEW_ACTIVATABLE_H__

#include <glib-object.h>

G_BEGIN_DECLS

/*
 * Type checking and casting macros
 */
#define PLUMA_TYPE_VIEW_ACTIVATABLE     (pluma_view_activatable_get_type ())
#define PLUMA_VIEW_ACTIVATABLE(obj)     (G_TYPE_CHECK_INSTANCE_CAST ((obj), PLUMA_TYPE_VIEW_ACTIVATABLE, PlumaViewActivatable))
#define PLUMA_VIEW_ACTIVATABLE_IFACE(obj)   (G_TYPE_CHECK_CLASS_CAST ((obj), PLUMA_TYPE_VIEW_ACTIVATABLE, PlumaViewActivatableInterface))
#define PLUMA_IS_VIEW_ACTIVATABLE(obj)      (G_TYPE_CHECK_INSTANCE_TYPE ((obj), PLUMA_TYPE_VIEW_ACTIVATABLE))
#define PLUMA_VIEW_ACTIVATABLE_GET_IFACE(obj)   (G_TYPE_INSTANCE_GET_INTERFACE ((obj), PLUMA_TYPE_VIEW_ACTIVATABLE, PlumaViewActivatableInterface))

typedef struct _PlumaViewActivatable           PlumaViewActivatable; /* dummy typedef */
typedef struct _PlumaViewActivatableInterface  PlumaViewActivatableInterface;

struct _PlumaViewActivatableInterface
{
    GTypeInterface g_iface;

    /* Virtual public methods */
    void    (*activate)     (PlumaViewActivatable *activatable);
    void    (*deactivate)       (PlumaViewActivatable   *activatable);
};

/*
 * Public methods
 */
GType    pluma_view_activatable_get_type    (void)  G_GNUC_CONST;

void     pluma_view_activatable_activate    (PlumaViewActivatable *activatable);
void     pluma_view_activatable_deactivate  (PlumaViewActivatable *activatable);

G_END_DECLS

#endif /* __PLUMA_VIEW_ACTIVATABLE_H__ */
