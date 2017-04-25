# Copyright (c) 2017 The Authors, All Rights Reserved.
include_recipe 'poise-python'
include_recipe 'apt::default'
#include_recipe 'supervisord'
# include_recipe 'gunicorn'

python_runtime '2'
python_virtualenv '/.virtualenvs/subscription_manager/'

directory '/.virtualenvs/subscription_manager/' do
	mode '777'
	action :create
end

# python_package 'Django' do
#   version '1.8'
# end

application '/srv/subscription_manager' do
  #virtualenv
  git "#{node[:subscription_manager][:repository_name]}" do
    deploy_key "#{node[:settings][:deploy_key]}"
    revision "#{node[:subscription_manager][:revision]}"
  end
  pip_requirements
end