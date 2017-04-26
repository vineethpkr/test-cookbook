# Copyright (c) 2017 The Authors, All Rights Reserved.
include_recipe 'poise-python'
include_recipe 'apt::default'
#include_recipe 'supervisord'
# include_recipe 'gunicorn'

python_runtime '2'
python_virtualenv '/.virtualenvs/noise_api/'

directory '/.virtualenvs/noise_api/' do
	mode '777'
	action :create
end

# python_package 'Django' do
#   version '1.8'
# end

application '/srv/noise_api' do
  #virtualenv
  git "#{node[:noise_api][:repository_name]}" do
    deploy_key "#{node[:settings][:deploy_key]}"
    revision "#{node[:noise_api][:revision]}"
  end
  pip_requirements
end