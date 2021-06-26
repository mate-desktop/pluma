/*
 * pluma-window-activatable.h
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

#include "pluma-window-activatable.h"
#include "pluma-window.h"

/**
 * SECTION:pluma-window-activatable
 * @short_description: Interface for activatable extensions on windows
 * @see_also: #PeasExtensionSet
 *
 * #PlumaWindowActivatable is an interface which should be implemented by
 * extensions that should be activated on a pluma main window.
 **/
G_DEFINE_INTERFACE(PlumaWindowActivatable, pluma_window_activatable, G_TYPE_OBJECT)

void
pluma_window_activatable_default_init (PlumaWindowActivatableInterface *iface)
{
    /**
     * PlumaWindowActivatable:window:
     *
     * The window property contains the pluma window for this
     * #PlumaWindowActivatable instance.
     */
    g_object_interface_install_property (iface,
                                         g_param_spec_object ("window",
                                                              "Window",
                                                              "The pluma window",
                                                              PLUMA_TYPE_WINDOW,
                                                              G_PARAM_READWRITE |
                                                              G_PARAM_CONSTRUCT_ONLY |
                                                              G_PARAM_STATIC_STRINGS));
}

/**
 * pluma_window_activatable_activate:
 * @activatable: A #PlumaWindowActivatable.
 *
 * Activates the extension on the window property.
 */
void
pluma_window_activatable_activate (PlumaWindowActivatable *activatable)
{
    PlumaWindowActivatableInterface *iface;

    g_return_if_fail (PLUMA_IS_WINDOW_ACTIVATABLE (activatable));

    iface = PLUMA_WINDOW_ACTIVATABLE_GET_IFACE (activatable);
    if (iface->activate != NULL)
    {
        iface->activate (activatable);
    }
}

/**
 * pluma_window_activatable_deactivate:
 * @activatable: A #PlumaWindowActivatable.
 *
 * Deactivates the extension on the window property.
 */
void
pluma_window_activatable_deactivate (PlumaWindowActivatable *activatable)
{
    PlumaWindowActivatableInterface *iface;

    g_return_if_fail (PLUMA_IS_WINDOW_ACTIVATABLE (activatable));

    iface = PLUMA_WINDOW_ACTIVATABLE_GET_IFACE (activatable);
    if (iface->deactivate != NULL)
    {
        iface->deactivate (activatable);
    }
}

/**
 * pluma_window_activatable_update_state:
 * @activatable: A #PlumaWindowActivatable.
 *
 * Triggers an update of the extension insternal state to take into account
 * state changes in the window state, due to some event or user action.
 */
void
pluma_window_activatable_update_state (PlumaWindowActivatable *activatable)
{
    PlumaWindowActivatableInterface *iface;

    g_return_if_fail (PLUMA_IS_WINDOW_ACTIVATABLE (activatable));

    iface = PLUMA_WINDOW_ACTIVATABLE_GET_IFACE (activatable);
    if (iface->update_state != NULL)
    {
        iface->update_state (activatable);
    }
}
