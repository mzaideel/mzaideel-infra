#
# Cookbook Name:: rubygems-balancer
# Recipe:: ssl
#

# ssl certificates directory
directory "#{node['nginx']['dir']}/certs" do
  owner 'root'
  group 'root'
  mode  '0644'
end

item = chef_vault_item('certs', node.chef_environment)

# ssl certificate key
file "#{node['nginx']['dir']}/certs/zaideel.com.key" do
  content item['key']
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

# ssl certificate
file "#{node['nginx']['dir']}/certs/zaideel.com.crt" do
  content item['crt']
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end
