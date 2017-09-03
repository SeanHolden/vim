#
# Cookbook:: vim
# Recipe:: default
#
# Copyright:: 2017, Sean Holden, All Rights Reserved.

include_recipe 'git::default'

if platform?('centos')

  package 'vim-enhanced'

elsif platform?('ubuntu')

  # install latest version (vim 8)
  apt_repository 'vim-8' do
    uri 'ppa:jonathonf/vim'
  end

  apt_update 'update'

  package 'vim' do
    action [:install, :upgrade]
  end
end

_user = node['vim']['user']

directory "/home/#{_user}/.vim" do
  owner _user
  group _user
  mode '755'
end

directory "/home/#{_user}/.vim/bundle" do
  owner _user
  group _user
  mode '755'
end

directory "/home/#{_user}/.vim/colors" do
  owner _user
  group _user
  mode '755'
end

template "/home/#{_user}/.vim/colors/monokai.vim" do
  source 'colors/monokai.vim.erb'
  owner _user
  group _user
  mode '644'
end

template "/home/#{_user}/.vimrc" do
  source 'vimrc.erb'
  owner _user
  group _user
  mode '644'
end

# install plugins
node['vim']['plugins'].each do |plugin|
  git "/home/#{_user}/.vim/bundle/#{plugin.split('/').last}" do
    repository "https://github.com/#{plugin}.git"
    user _user
    group _user
    environment ({ 'HOME' => "/home/#{_user}", 'USER' => _user })
    timeout 10
  end
end
