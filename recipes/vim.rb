package 'vim-enhanced'

['.vim', '.vim/bundle', '.vim/autoload'].each do |path|
  directory "#{node['tools']['user']['home']}/#{path}" do
    user node['tools']['user']['name']
    group node['tools']['user']['name']
  end
end

remote_file "#{node['tools']['user']['home']}/.vim/autoload/pathogen.vim" do
  source 'https://tpo.pe/pathogen.vim'
  user node['tools']['user']['name']
  group node['tools']['user']['name']
end

node['tools']['vim']['plugins'].each do |name, url|
  bash "install vim plugin #{name}" do
    cwd "#{node['tools']['user']['home']}/.vim/bundle"
    user node['tools']['user']['name']
    group node['tools']['user']['name']
    code "git clone #{url}" 
    not_if { ::File.exists?("#{node['tools']['user']['home']}/.vim/bundle/#{name}") }
  end
end

cookbook_file "#{node['tools']['user']['home']}/.vimrc" do
  source 'vimrc'
end

bash "set TERM=xterm-256color environment variable" do
  user node['tools']['user']['name']
  code "echo 'export TERM=xterm-256color' >> #{node['tools']['user']['home']}/.bashrc" 
  not_if "grep -q 'export TERM=xterm-256color' #{node['tools']['user']['home']}/.bashrc"
end
