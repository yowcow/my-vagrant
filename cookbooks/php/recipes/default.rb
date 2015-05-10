#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{
  apache2
  apache2-dev
  build-essential

  openssl
  libssl-dev
  openssl-blacklist
  openssl-blacklist-extra
  bison
  autoconf
  automake
  libtool
  re2c
  flex

  libxml2-dev
  libssl-dev
  libbz2-dev
  libcurl3-dev
  libdb5.1-dev
  libjpeg-dev
  libpng-dev
  libXpm-dev
  libfreetype6-dev
  libt1-dev
  libgmp3-dev
  libc-client-dev
  libldap2-dev
  libmcrypt-dev
  libmhash-dev
  freetds-dev
  libz-dev
  libmysqlclient15-dev
  ncurses-dev
  libpcre3-dev
  libsqlite-dev
  libaspell-dev
  libreadline6-dev
  librecode-dev
  libsnmp-dev
  libtidy-dev
  libxslt-dev
  libt1-dev
}.each do |pkg|
  package pkg do
    action :install
  end
end

php_version = '5.3.3'

remote_file "/tmp/php-#{php_version}.tar.gz" do
  source "http://museum.php.net/php5/php-#{php_version}.tar.gz"
  action :create_if_missing
end
