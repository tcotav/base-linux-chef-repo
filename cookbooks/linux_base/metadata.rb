name             'linux_base'
maintainer       'gnslngr.us'
maintainer_email 'james@gnslngr.us'
license          'Apache 2.0'
description      'Installs/Configures linux_base'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

depends "users"
depends "openssh"
depends "sudo"
