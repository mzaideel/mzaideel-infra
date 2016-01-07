#
# Cookbook Name:: rubygems-logging
# Recipe:: default
#

node.default['rsyslog']['server_ip'] = log_server['ipaddress']
node.default['rsyslog']['port'] = '5959'
node.default['rsyslog']['preserve_fqdn'] = 'on'
node.default['rsyslog']['high_precision_timestamps'] = true
