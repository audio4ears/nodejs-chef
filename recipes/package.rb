#
# Cookbook Name:: nodejs-chef
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

bash 'install_nodejs' do
  case node['platform_family']
  when 'debian'
    code <<-EOF
      curl --sient --location https://deb.nodesource.com/setup_#{node['nodejs']['package']['version']} | bash -
      apt-get install -y nodejs
      EOF
  when 'rhel'
    code <<-EOF
      curl --silent --location https://rpm.nodesource.com/setup_#{node['nodejs']['package']['version']} | bash -
      yum install -y nodejs
      EOF
  end
end

node['nodejs']['global_npms'].each do |g_npm|
  bash "install_#{g_npm}" do
    code "npm install -g #{g_npm}"
  end
end unless node['nodejs']['global_npms'].empty?

node['nodejs']['npms'].each do |npm|
  bash "install_#{npm}" do
    code "npm install #{npm}"
  end
end unless node['nodejs']['npms'].empty?
