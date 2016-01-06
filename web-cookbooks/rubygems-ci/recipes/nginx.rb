#
# Cookbook Name:: rubygems-ci
# Recipe:: nginx
#

node.default['nginx']['server_tokens'] = 'off'
node.default['nginx']['default_site_enabled'] = false

include_recipe 'chef-vault'

include_recipe 'nginx'

directory "#{node['nginx']['dir']}/certs" do
  owner 'root'
  group 'root'
  mode  '0644'
end

item = chef_vault_item('certs', 'production')

file "#{node['nginx']['dir']}/certs/zaideel.com.key" do
  content item['key']
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

file "#{node['nginx']['dir']}/certs/zaideel.com.crt" do
  content item['crt']
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

template "#{node['nginx']['dir']}/sites-available/jenkins" do
  source 'nginx.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  variables(
    ssl_key: File.join(node['nginx']['dir'], 'certs', 'zaideel.com.key'),
    ssl_cert: File.join(node['nginx']['dir'], 'certs', 'zaideel.com.crt')
  )
  notifies :reload, 'service[nginx]'
end

nginx_site 'jenkins'
