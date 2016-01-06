#
# Cookbook Name:: rubygems-app
# Recipe:: deploy_user
#

include_recipe 'user'

users = data_bag('users')
keys = []

users.each do |user_name|
  user = data_bag_item('users', user_name)
  user['ssh_keys'].each { |k| keys << k } if user['deployer'] == true && user['environments'].include?(node.chef_environment)
end

user_account 'deploy' do
  comment   'Application Deployment'
  password  '$1$kjbAvpUx$mBne7jqRAinTr3/sA8NAr.'
  ssh_keys  keys
end
