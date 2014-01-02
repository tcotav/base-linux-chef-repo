current_dir              "/Users/james/dev/base_server_image/.chef"
cookbook_copyright       "gnslngr.us"
cookbook_license         "apachev2"
cookbook_email           "james@gnslngr.us"
log_level                :info
log_location             STDOUT
#node_name                "jamesfrancis"
#client_key               "#{current_dir}/jamesfrancis.pem"
validation_client_name   "gnslngr-validator"
validation_key           "#{current_dir}/gnslngr-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/gnslngr"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
