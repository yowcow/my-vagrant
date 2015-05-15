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
  libxpm-dev
  libfreetype6-dev
  libt1-dev
  libgmp-dev
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

%w{
  gmp.h
}.each do |file|
  link "/usr/include/#{file}" do
    link_type :symbolic
    to "/usr/include/x86_64-linux-gnu/#{file}"
    action :create
  end
end

%w{
  libjpeg.a
  libjpeg.so
  libpng.a
  libpng.so
}.each do |file|
  link "/usr/lib/#{file}" do
    link_type :symbolic
    to "/usr/lib/x86_64-linux-gnu/#{file}"
    action :create
  end
end

remote_file "/tmp/php-5.3.3.tar.gz" do
  source "http://museum.php.net/php5/php-5.3.3.tar.gz"
  action :create_if_missing
end

bash "Extract tarball" do
  code <<-COMMAND
    cd /tmp
    rm -rf php-5.3.3
    tar xvzf php-5.3.3.tar.gz
  COMMAND
end

template "/tmp/php-5.3.3.patch" do
  source 'php-5.3.3.patch'
end

bash "Patch PHP" do
  code <<-COMMAND
    cd /tmp/php-5.3.3
    patch -p0 < /tmp/php-5.3.3.patch
  COMMAND
end

bash "Install" do
  code <<-COMMAND
    cd /tmp/php-5.3.3
    ./configure \
      --prefix=/usr/local/php-5.3.3 \
      --disable-dom
    make
    make install
  COMMAND
end
