#
# Cookbook Name:: rubygems-app
# Recipe:: delayed_job
#

redis_host = data_bag_item('hosts', 'redis')['environments'][node.chef_environment]
redis_ip = search('node', "name:#{redis_host}.#{node.chef_environment}.zaideel.com")[0]['ipaddress']

runit_service 'delayed_job' do
  owner 'deploy'
  group 'deploy'
  default_logger true
  env(
    'RAILS_ENV' => node.chef_environment,
    'REDISTOGO_URL' => "redis://#{redis_ip}:6379/0"
  )
  options(
    owner: 'deploy',
    group: 'deploy',
    bundle_command: '/usr/local/bin/bundle',
    rails_env: node.chef_environment
  )
  action ::File.exist?('/applications/rubygems/current') ? :enable : :disable
end
