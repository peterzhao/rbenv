include_recipe "nodejs"

nodejs_npm "mountebank" do
  not_if { ::File.exists?('/usr/bin/mb') } 
end

cookbook_file '/etc/init/mb.conf' do
  source 'mb.conf'
end

service 'mb' do
  action [:enable, :start]
  provider Chef::Provider::Service::Upstart 
end
