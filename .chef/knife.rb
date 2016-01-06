chef_username = ENV['RUBYGEMS_CHEF_USERNAME'] || ENV['USER']
current_dir = File.dirname(__FILE__)

log_level                :info
log_location             STDOUT
node_name                chef_username
client_key               "#{current_dir}/#{chef_username}.pem"
validation_client_name   "rubygems-validator"
validation_key           "#{current_dir}/mzaideel-validator.pem"
chef_server_url          "https://api.chef.io/organizations/mzaideel"
#chef_server_url		  "http://localhost:8889"

cookbook_path             ["#{current_dir}/../cookbooks"]
cookbook_copyright        'Zaideel.Com, Inc.'
cookbook_email            'chef@zaideel.com'
cookbook_maintainer	  		'Zaideel.Com, Inc.'
environment_path          "#{current_dir}/../environments"

knife[:bootstrap_file] = "#{current_dir}/bootstrap/rubygems-trusty.erb"

# Provision new instances with knife-ec2
knife[:region] = "us-east-1"
knife[:availability_zone] = "us-east-1d"
knife[:image] = "ami-0f8bce65"
knife[:flavor] = "t2.micro"
#knife[:aws_access_key_id] = ENV['RUBYGEMS_AWS_ACCESS_KEY_ID']
#knife[:aws_secret_access_key] = ENV['RUBYGEMS_AWS_SECRET_KEY"

knife[:aws_access_key_id] = "AKIAJX7KOUNOKKK5STXA"
knife[:aws_secret_access_key] = "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" 
knife[:aws_ssh_key_id] = "mzaideel"
knife[:aws_group_id] = "sg-25d32c5c"

knife[:vault_mode] = "client"
knife[:vault_admins] = "mzaideel"
