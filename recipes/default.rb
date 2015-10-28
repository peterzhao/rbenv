user = node['rbenv']['user']['name']
user_home = node['rbenv']['user']['home']

execute 'install rbenv' do
  command "git clone https://github.com/sstephenson/rbenv.git #{user_home}/.rbenv"
  user user
  group user
  not_if { ::File.exists? "#{user_home}/.rbenv" }
end

directory "#{user_home}/.rbenv/plugins" do
  owner user
  group user
end

execute 'install ruby_build' do
  command "git clone https://github.com/sstephenson/ruby-build.git #{user_home}/.rbenv/plugins/ruby-build"
  user user
  group user
  not_if { ::File.exists? "#{user_home}/.rbenv/plugins/ruby-build" }
end

template "#{user_home}/.rbenv.rc" do
  source 'rbenv.rc.erb'
  owner user
  group user
  mode '0755'
end


execute 'source .rbenv.rc' do
  command %{echo "source #{user_home}/.rbenv.rc" >> #{user_home}/.bashrc}
  user user
  group user
  not_if { ::File.read("#{user_home}/.bashrc").include?("source #{user_home}/.rbenv.rc") }
end

%w{openssl-devel readline-devel zlib-devel}.each do |package_name|
  package package_name
end

node['rbenv']['versions'].each do |ruby_version|
  bash_code = %{ 
  export RBENV_ROOT="#{user_home}/.rbenv"
  export PATH="${RBENV_ROOT}/bin:$PATH"
  eval "$(rbenv init -)"
  rbenv install #{ruby_version} 
  } 

  script "install ruby #{ruby_version}" do
    interpreter 'bash'
    code bash_code 
    user user 
    cwd "#{user_home}" 
    group user 
    not_if { ::File.exist? "#{user_home}/.rbenv/versions/#{ruby_version}" }
  end
end
