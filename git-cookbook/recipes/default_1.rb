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

Chef::Log.info "Var from AWS consolde #{node[:test_var]}"

application '/srv/flask_test_2' do
	git 'https://github.com/vineethpkr/test_flask.git'
	pip_requirements
	gunicorn do
    	port 5000
  	end
end
