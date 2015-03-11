#
# Cookbook Name:: anyenv
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git 'anyenv' do
  user  'vagrant'
  group 'vagrant'
  repository node['anyenv']['repository']
  reference  node['anyenv']['reference']
  destination '/home/vagrant/.anyenv'
  action :sync
end

bash 'profile' do
  user  'vagrant'
  group 'vagrant'
  code <<-COMMAND
echo '
export PATH="/home/vagrant/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
' > /home/vagrant/.anyenvrc
  COMMAND
end
