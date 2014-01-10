current_dir = File.dirname(__FILE__)
user_email  = `git config --get user.email`
home_dir    = ENV['HOME'] || ENV['HOMEDRIVE']
org         = ENV['chef_org'] || 'my_org'

# Allows chefs to override values in this knife.rb
knife_override = "#{home_dir}/.chef/knife_override.rb"

# Allows chefs to configure a custom location for chef-repo via ENV
chef_home = ENV['CHEF_HOME'] || "#{home_dir}/chef-repo"

#chef_server_url          "https://chefserver.example.com/organizations/#{org}"
chef_server_url          'https://ec2-54-203-255-227.us-west-2.compute.amazonaws.com'
log_level                :info
log_location             STDOUT

# USERNAME is UPPERCASE in Windows, but lowercase in the Chef server,
# so `downcase` it.
node_name                ( ENV['USER'] || ENV['USERNAME'] ).downcase
client_key               "#{chef_home}/.chef/#{node_name}.pem"
cache_type               'BasicFile'
cache_options( :path => "#{home_dir}/.chef/checksums" )
syntax_check_cache_path  '/home/bmiller/chef-repo/.chef/syntax_check_cache'

# In case we're needing a validator
validation_client_name   'chef-validator'
validation_key           "#{chef_home}/.chef/chef-validator.pem"

# We keep our cookbooks in separate repos under a ~/chef/cookbooks dir
#cookbook_path            ["#{current_dir}/../../../cookbooks"]
cookbook_path [ '~/chef-repo/cookbooks', '~/chef-repo/vendor-cookbooks' ]
cookbook_copyright       "Level 11 Consulting"
cookbook_license         "reserved"
cookbook_email           "#{user_email}"

# AWS credentials pulled from user's ENV
knife[:aws_access_key_id] = ENV['AWS_ACCESS_KEY_ID']
knife[:aws_ssh_key_id] = ENV['AWS_KEY_ID']
knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY']

###
# Other AWS defaults, for use with knife-ec2
###

# Default flavor of EC2 server (m1.small, c1.medium, etc).
knife[:flavor] = "m1.small"

# Default AMI identifier, e.g. ami-12345678
knife[:image] = "ami-fc7712cc"

# AWS Region (us-west-2 is Oregon)
knife[:region] = "us-west-2"

# AWS Availability Zone. Must be in the same Region.
knife[:availability_zone] = "us-west-2b"

# A file with EC2 User Data to provision the instance.
#knife[:aws_user_data] = ""

# AWS SSH Keypair.
#knife[:aws_ssh_key_id] = ""

# Allow overriding values in this knife.rb
Chef::Config.from_file(knife_override) if File.exist?(knife_override)
