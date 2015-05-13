#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'nginx' do
  action :install
end

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

file '/etc/nginx/sites-enabled/default' do
  manage_symlink_source true
  action :delete
  notifies :reload, 'service[nginx]'
end

template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  notifies :reload, 'service[nginx]'
end

template '/etc/nginx/sites-enabled/default' do
  source 'vh-default.conf.erb'
  variables({
    :fqdn         => 'yowcowvg.local',
    :proxy_port   => '5000',
  })
  notifies :reload, 'service[nginx]'
end
