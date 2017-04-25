# Copyright (c) 2017 The Authors, All Rights Reserved.
include_recipe 'poise-python'
include_recipe 'apt::default'
#include_recipe 'supervisord'
# include_recipe 'gunicorn'

python_runtime '2'
python_virtualenv '/.virtualenvs/gnip_connector/'

directory '/.virtualenvs/gnip_connector/' do
	mode '777'
	action :create
end

# python_package 'Django' do
#   version '1.8'
# end

application '/srv/gnip_connector' do
  #virtualenv
  git "#{node[:gnip_connector][:repository_name]}" do
    deploy_key "#{node[:settings][:deploy_key]}"
    revision "#{node[:gnip_connector][:revision]}"
  end
  pip_requirements
end