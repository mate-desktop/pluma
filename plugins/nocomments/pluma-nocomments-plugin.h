

#ifndef __PLUMA_NOCOMMENTS_PLUGIN_H__
#define __PLUMA_NOCOMMENTS_PLUGIN_H__

#include <glib.h>
#include <glib-object.h>
#include <libpeas/peas-extension-base.h>
#include <libpeas/peas-object-module.h>

G_BEGIN_DECLS

/*
 * Type checking and casting macros
 */
#define PLUMA_TYPE_NOCOMMENTS_PLUGIN		(pluma_nocomments_plugin_get_type ())
#define PLUMA_NOCOMMENTS_PLUGIN(o)		(G_TYPE_CHECK_INSTANCE_CAST ((o), PLUMA_TYPE_NOCOMMENTS_PLUGIN, PlumaNoCommentsPlugin))
#define PLUMA_NOCOMMENTS_PLUGIN_CLASS(k)	(G_TYPE_CHECK_CLASS_CAST((k), PLUMA_TYPE_NOCOMMENTS_PLUGIN, PlumaNoCommentsPluginClass))
#define PLUMA_IS_NOCOMMENTS_PLUGIN(o)		(G_TYPE_CHECK_INSTANCE_TYPE ((o), PLUMA_TYPE_NOCOMMENTS_PLUGIN))
#define PLUMA_IS_NOCOMMENTS_PLUGIN_CLASS(k)	(G_TYPE_CHECK_CLASS_TYPE ((k), PLUMA_TYPE_NOCOMMENTS_PLUGIN))
#define PLUMA_NOCOMMENTS_PLUGIN_GET_CLASS(o)	(G_TYPE_INSTANCE_GET_CLASS ((o), PLUMA_TYPE_NOCOMMENTS_PLUGIN, PlumaNoCommentsPluginClass))

/* Private structure type */
typedef struct _PlumaNoCommentsPluginPrivate	PlumaNoCommentsPluginPrivate;

/*
 * Main object structure
 */
typedef struct _PlumaNoCommentsPlugin		PlumaNoCommentsPlugin;

struct _PlumaNoCommentsPlugin
{
	PeasExtensionBase parent_instance;

	/*< private >*/
	PlumaNoCommentsPluginPrivate *priv;
};

/*
 * Class definition
 */
typedef struct _PlumaNoCommentsPluginClass	PlumaNoCommentsPluginClass;

struct _PlumaNoCommentsPluginClass
{
	PeasExtensionBaseClass parent_class;
};

/*
 * Public methods
 */
GType	pluma_nocomments_plugin_get_type		(void) G_GNUC_CONST;

/* All the plugins must implement this function */
G_MODULE_EXPORT void peas_register_types (PeasObjectModule *module);

G_END_DECLS

#endif /* __PLUMA_NOCOMMENTS_PLUGIN_H__ */
