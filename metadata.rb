name             'tools'
maintainer       'Peter Zhao'
maintainer_email ''
license          'MIT'
description      'Installs some tools on linux including rbenv, ruby and tmate'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'nodejs', '~> 2.4.4' 
%w(centos redhat).each do |os|
    supports os
end
