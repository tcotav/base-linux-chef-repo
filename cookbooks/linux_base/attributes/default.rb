# Make sure ssh is key-based only, block root login
default['openssh']['server']['permit_root_login'] = "no"
default['openssh']['server']['password_authentication'] = "no"

# make sudo password-less as well
default['authorization']['sudo']['passwordless']=true
default['authorization']['sudo']['groups']=['staff']
