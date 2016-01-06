#
# Cookbook Name:: rubygems-hostname
# Recipe:: dns
#

include_recipe 'chef-vault'

aws_credentials = chef_vault_item('aws', 'credentials')

include_recipe 'dns'

if node['cloud_v2']
  value = node['cloud_v2']['public_hostname']
  type = 'CNAME'
else
  value = Mixlib::ShellOut.new('/usr/bin/curl http://169.254.169.254/latest/meta-data/public-ipv4').run_command.stdout.chomp
  type = 'A'
end

dns_record "create record for #{node.name}" do
  name node.name.sub('.rubygems.org', '')
  value value
  type type
  domain 'rubygems.org'
  zone_id 'Z3ME4ZZV9EACZN'
  credentials(
    route53: { aws_access_key_id: aws_credentials['access_key_id'], aws_secret_access_key: aws_credentials['secret_access_key'] }
  )
end