#
# Cookbook Name:: rubygems-chef-server
# Recipe:: default
#

node.default['chef-server']['api_fqdn'] = 'chef.zaideel.com'
node.default['chef-server']['configuration']['nginx']['ssl_certificate'] = '/etc/chef-server/zaideel.com.crt'
node.default['chef-server']['configuration']['nginx']['ssl_certificate_key'] = '/etc/chef-server/zaideel.com.key'

include_recipe 'chef-vault'

item = chef_vault_item('certs', 'production')

directory '/etc/chef-server'

file '/etc/chef-server/zaideel.com.key' do
  content item['key']
  owner  'root'
  group  'root'
  mode   '0644'
end

file '/etc/chef-server/zaiideel.com.crt' do
  content item['crt']
  owner  'root'
  group  'root'
  mode   '0644'
end

include_recipe 'chef-server'
