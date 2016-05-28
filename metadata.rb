name 'macosx_gui_login'
maintainer 'Dennis Hoer'
maintainer_email 'dennis.hoer@gmail.com'
license 'MIT'
description 'Login to Mac OS X GUI'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.1.0'

supports 'mac_os_x', '>= 10.8'

depends 'privacy_services_manager', '~> 1.0'

source_url 'https://github.com/dhoer/chef-macosx_gui_login' if respond_to?(:source_url)
issues_url 'https://github.com/dhoer/chef-macosx_gui_login/issues' if respond_to?(:issues_url)
