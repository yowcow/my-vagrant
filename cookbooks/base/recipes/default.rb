#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{
  build-essential
  cronolog
  curl
  git
  libexpat1-dev
  libffi-dev
  libpng12-dev
  libxml2-dev
  mongodb
  mysql-server-5.6
  nginx
  screen
  sqlite3
  supervisor
  tmux
  tree
  vim
  zip
  zsh
}.each do |pkg|
  package pkg do
    action :install
  end
end
