/*
 * pluma-view-activatable.h
 * This file is part of pluma
 *
 * Copyright (C) 2010 Steve Frécinaux
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

#include <config.h>

#include "pluma-view-activatable.h"
#include "pluma-view.h"

/**
 * SECTION:pluma-view-activatable
 * @short_description: Interface for activatable extensions on views
 * @see_also: #PeasExtensionSet
 *
 * #PlumaViewActivatable is an interface which should be implemented by
 * extensions that should be activated on a pluma view.
 **/
G_DEFINE_INTERFACE(PlumaViewActivatable, pluma_view_activatable, G_TYPE_OBJECT)

void
pluma_view_activatable_default_init (PlumaViewActivatableInterface *iface)
{
    /**
     * PlumaViewActivatable:view:
     *
     * The window property contains the pluma window for this
     * #PlumaViewActivatable instance.
     */
    g_object_interface_install_property (iface,
                                         g_param_spec_object ("view",
                                                              "view",
                                                              "A pluma view",
                                                              PLUMA_TYPE_VIEW,
                                                              G_PARAM_READWRITE |
                                                              G_PARAM_CONSTRUCT_ONLY |
                                                              G_PARAM_STATIC_STRINGS));
}

/**
 * pluma_view_activatable_activate:
 * @activatable: A #PlumaViewActivatable.
 *
 * Activates the extension on the window property.
 */
void
pluma_view_activatable_activate (PlumaViewActivatable *activatable)
{
    PlumaViewActivatableInterface *iface;

    g_return_if_fail (PLUMA_IS_VIEW_ACTIVATABLE (activatable));

    iface = PLUMA_VIEW_ACTIVATABLE_GET_IFACE (activatable);
    if (iface->activate != NULL)
    {
        iface->activate (activatable);
    }
}

/**
 * pluma_view_activatable_deactivate:
 * @activatable: A #PlumaViewActivatable.
 *
 * Deactivates the extension on the window property.
 */
void
pluma_view_activatable_deactivate (PlumaViewActivatable *activatable)
{
    PlumaViewActivatableInterface *iface;

    g_return_if_fail (PLUMA_IS_VIEW_ACTIVATABLE (activatable));

    iface = PLUMA_VIEW_ACTIVATABLE_GET_IFACE (activatable);
    if (iface->deactivate != NULL)
    {
        iface->deactivate (activatable);
    }
}
