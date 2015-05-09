#
# Cookbook Name:: sysstat
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'sysstat' do
  action :install
end

service 'sysstat' do
  supports :status => true, :start => true, :stop => true, :restart => true, :reload => true
  action [:enable, :start]
end

template '/etc/default/sysstat' do
  source 'sysstat'
  notifies :restart, 'service[sysstat]'
end
