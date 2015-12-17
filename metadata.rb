name             'rbenv'
maintainer       'Peter Zhao'
maintainer_email ''
license          'All rights reserved'
description      'Installs rbenv and ruby'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w(centos redhat).each do |os|
    supports os
end
