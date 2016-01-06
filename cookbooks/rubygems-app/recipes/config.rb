#
# Cookbook Name:: rubygems-app
# Recipe:: config
#

include_recipe 'chef-vault'

dbhost = data_bag_item('hosts', 'database')['environments'][node.chef_environment]

secrets = chef_vault_item('rubygems', node.chef_environment)
db_host = search(:node, "name:#{dbhost}.#{node.chef_environment}.zaideel.com")[0]

template '/applications/rubygems/shared/database.yml' do
  source 'database.yml.erb'
  owner 'deploy'
  group 'deploy'
  mode '0644'
  variables(
    rails_env: node.chef_environment,
    adapter: 'postgresql',
    database: "rubygems_#{node.chef_environment}",
    username: secrets['rails_postgresql_user'],
    password: db_host['postgresql']['password']['postgres'],
    host: db_host['ipaddress']
  )
end

template '/applications/rubygems/shared/secret.rb' do
  source 'secret.rb.erb'
  owner  'deploy'
  group  'deploy'
  mode   '0640'
  action :create
  variables(
    s3_key: secrets['s3_key'],
    s3_secret: secrets['s3_secret'],
    secret_token: secrets['secret_token'],
    bundler_token: secrets['bundler_token'],
    bundler_api_url: secrets['bundler_api_url'],
    new_relic_license_key: secrets['new_relic_license_key'],
    new_relic_app_name: "zaideel.com (#{node.chef_environment})"
  )
end
