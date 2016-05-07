#
# Cookbook Name:: nodejs-chef
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# include recipe(s)
include_recipe "#{cookbook_name}::#{node['nodejs']['install_method']}"
