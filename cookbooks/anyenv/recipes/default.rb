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

%w{
  plenv
  ndenv
  rbenv
}.each do |langenv|
  bash "install #{langenv}" do
    user  'vagrant'
    group 'vagrant'
    environment 'ANYENV_ROOT' => '/home/vagrant/.anyenv', 'HOME' => '/home/vagrant'
    code <<-COMMAND
    . /home/vagrant/.anyenvrc
    anyenv install #{langenv}
    COMMAND
    creates "/home/vagrant/.anyenv/envs/#{langenv}"
  end
end
