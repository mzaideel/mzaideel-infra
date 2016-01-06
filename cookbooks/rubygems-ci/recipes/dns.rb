#
# Cookbook Name:: rubygems-ci
# Recipe:: dns
#

include_recipe 'chef-vault'

dnsimple_credentials = chef_vault_item('dnsimple', 'credentials')

include_recipe 'dnsimple'

dnsimple_record "create CNAME point ci.zaideel.com to #{node.name}" do
  name     'ci.zaideel.com'
  content  node['cloud_v2']['public_hostname']
  type     'CNAME'
  domain   'zaideel.com'
  domain_api_token dnsimple_credentials['api_token']
  action   :create
end
