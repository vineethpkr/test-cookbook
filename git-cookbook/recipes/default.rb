# if node['platform'] == "ubuntu" && node['platform_version'].to_f <= 10.04
#   package "git-core"
# else
#   package "git"
# end

# log "Well, that was too easy"

#
# Cookbook Name:: first_test
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
include_recipe 'poise-python'
include_recipe 'apt::default'
python_runtime '2'
# application '/srv/flask_test' do
# 	git 'https://github.com/poise/test_flask.git'
# 	pip_requirements
# 	gunicorn do
#     	port 9001
#   	end
# end

template "/etc/monit.d/social_tab.monitrc" do 
      owner 'root' 
      group 'root' 
      mode 0700
      source "social_tab.monitrc.erb" 
    end