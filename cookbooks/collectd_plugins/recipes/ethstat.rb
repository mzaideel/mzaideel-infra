#
## Cookbook name: collectd_plugins
## Recipe: ethstat
#

include_recipe 'collectd'

collectd_plugin 'ethstat'
