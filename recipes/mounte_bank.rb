#package 'nodejs' do
  #version node['tools']['nodejs']['version']
#end

#package 'npm' do
  #version node['tools']['npm']['version']
#end

include_recipe "nodejs"

nodejs_npm "mountebank" do
  not_if { ::File.exists?('/usr/bin/mb') } 
end
