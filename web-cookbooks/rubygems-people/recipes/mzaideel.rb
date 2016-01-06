#
# Cookbook Name:: rubygems-people
# Recipe:: mzaideel
#

home = '/home/mzaideel'

directory "#{home}/src" do
  owner 'mzaideel'
  group 'mzaideel'
end

package 'tmux' do
  action :install
end

git "#{home}/src/dotfiles" do
  repository 'https://github.com/skottler/dotfiles'
  revision 'master'
  action :sync
  user 'mzaideel'
end

%w( .gitconfig .pryrc .tmux.conf .gemrc .ackrc ).each do |file|
  link "#{home}/#{file}" do
    to "#{home}/src/dotfiles/#{file}"
  end
end
