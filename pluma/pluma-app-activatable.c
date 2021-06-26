/*
 * pluma-app-activatable.h
 * This file is part of pluma
 *
 * Copyright (C) 2010 Steve Frécinaux
 * Copyright (C) 2010 Jesse van den Kieboom
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

#include "pluma-app-activatable.h"
#include "pluma-app.h"

/**
 * SECTION:pluma-app-activatable
 * @short_description: Interface for activatable extensions on apps
 * @see_also: #PeasExtensionSet
 *
 * #PlumaAppActivatable is an interface which should be implemented by
 * extensions that should be activated on a pluma application.
 **/

G_DEFINE_INTERFACE(PlumaAppActivatable, pluma_app_activatable, G_TYPE_OBJECT)

void
pluma_app_activatable_default_init (PlumaAppActivatableInterface *iface)
{
    static gboolean initialized = FALSE;

    if (!initialized)
    {
        /**
         * PlumaAppActivatable:app:
         *
         * The app property contains the pluma app for this
         * #PlumaAppActivatable instance.
         */
        g_object_interface_install_property (iface,
                                             g_param_spec_object ("app",
                                                                  "App",
                                                                  "The pluma app",
                                                                  PLUMA_TYPE_APP,
                                                                  G_PARAM_READWRITE |
                                                                  G_PARAM_CONSTRUCT_ONLY |
                                                                  G_PARAM_STATIC_STRINGS));

        initialized = TRUE;
    }
}

/**
 * pluma_app_activatable_activate:
 * @activatable: A #PlumaAppActivatable.
 *
 * Activates the extension on the application.
 */
void
pluma_app_activatable_activate (PlumaAppActivatable *activatable)
{
    PlumaAppActivatableInterface *iface;

    g_return_if_fail (PLUMA_IS_APP_ACTIVATABLE (activatable));

    iface = PLUMA_APP_ACTIVATABLE_GET_IFACE (activatable);

    if (iface->activate != NULL)
    {
        iface->activate (activatable);
    }
}

/**
 * pluma_app_activatable_deactivate:
 * @activatable: A #PlumaAppActivatable.
 *
 * Deactivates the extension from the application.
 *
 */
void
pluma_app_activatable_deactivate (PlumaAppActivatable *activatable)
{
    PlumaAppActivatableInterface *iface;

    g_return_if_fail (PLUMA_IS_APP_ACTIVATABLE (activatable));

    iface = PLUMA_APP_ACTIVATABLE_GET_IFACE (activatable);

    if (iface->deactivate != NULL)
    {
        iface->deactivate (activatable);
    }
}
