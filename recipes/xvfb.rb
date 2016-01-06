['xorg-x11-server-Xvfb', 'firefox'].each do |package_name|
  package package_name
end

cookbook_file '/etc/init/xvfb.conf' do
  source 'xvfb.conf'
end

service 'xvfb' do
  action [:enable, :start]
  provider Chef::Provider::Service::Upstart 
end

user_name = node['tools']['user']['name']
user_home = node['tools']['user']['home']

execute 'export DISPLAY' do
  command %{echo "export DISPLAY=:99" >> #{user_home}/.bashrc}
  user user_name
  group user_name
  not_if { ::File.read("#{user_home}/.bashrc").include?("export DISPLAY=:99") }
end
