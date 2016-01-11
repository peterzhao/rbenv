remote_file "#{Chef::Config[:file_cache_path]}/tmate-2.2.0-static-linux64.tar.gz" do
  source "https://github.com/tmate-io/tmate/releases/download/2.2.0/tmate-2.2.0-static-linux64.tar.gz"
  not_if { ::File.exists?("#{Chef::Config[:file_cache_path]}/tmate-2.2.0-static-linux64.tar.gz") } 
end

bash 'install tmate' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
tar -zxvf tmate-2.2.0-static-linux64.tar.gz
mv tmate-2.2.0-static-linux64/tmate /usr/local/bin/
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

