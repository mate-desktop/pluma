/*
 * pluma-view-activatable.h
 * This file is part of pluma
 *
 * Copyright (C) 2010 - Steve Frécinaux
 * Copyright (C) 2012-2021 MATE Developers
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

#ifndef __PLUMA_VIEW_ACTIVATABLE_H__
#define __PLUMA_VIEW_ACTIVATABLE_H__

#include <glib-object.h>

G_BEGIN_DECLS

/*
 * Type checking and casting macros
 */
#define PLUMA_TYPE_VIEW_ACTIVATABLE (pluma_view_activatable_get_type ())

G_DECLARE_INTERFACE (PlumaViewActivatable, pluma_view_activatable, PLUMA, VIEW_ACTIVATABLE, GObject)

typedef struct _PlumaViewActivatable           PlumaViewActivatable; /* dummy typedef */
typedef struct _PlumaViewActivatableInterface  PlumaViewActivatableInterface;

struct _PlumaViewActivatableInterface
{
    GTypeInterface g_iface;

    /* Virtual public methods */
    void    (*activate)         (PlumaViewActivatable   *activatable);
    void    (*deactivate)       (PlumaViewActivatable   *activatable);
};

/*
 * Public methods
 */
void     pluma_view_activatable_activate    (PlumaViewActivatable *activatable);
void     pluma_view_activatable_deactivate  (PlumaViewActivatable *activatable);

G_END_DECLS

#endif /* __PLUMA_VIEW_ACTIVATABLE_H__ */
