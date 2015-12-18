%w{ git zlib-devel openssl-devel ncurses-devel cmake ruby libssh-devel wget }.each do |package_name|
  package package_name
end

%w{ libevent-devel libevent-doc libevent-headers libevent }.each do |package_name|
  package package_name do
    version '1.4.13-4.el6'
    action :remove
  end
end

remote_file "/root/libevent-2.0.21-stable.tar.gz" do
  source "https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz"
end

bash 'install libevent2.0.21' do
  cwd '/root' 
  code <<-EOH
tar xf libevent-2.0.21-stable.tar.gz
cd libevent-2.0.21-stable
./configure
make
make install
ln -s /usr/local/lib/libevent-2.0.so.5 /usr/lib64/libevent-2.0.so.5
  EOH
  not_if { ::File.exists?('/usr/local/lib/libevent-2.0.so.5') }
end

bash 'install tmate' do
  cwd '/root' 
  code <<-EOH
git clone https://github.com/nviennot/tmate
cd tmate
./autogen.sh
./configure
make
make install
EOH
  not_if { ::File.exists?('/usr/local/bin/tmate') }
end

bash 'install ssh key' do
  cwd node['tools']['user']['home']
  user node['tools']['user']['name']
  group node['tools']['user']['name']
  code <<-EOH
mkdir -p .ssh
cd .ssh
ssh-keygen -t rsa -N "" -f id_rsa
  EOH
  not_if { ::File.exists?("#{node['tools']['user']['home']}/.ssh/id_rsa") }
end

