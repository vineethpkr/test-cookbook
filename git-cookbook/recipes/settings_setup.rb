# Copyright (c) 2017 The Authors, All Rights Reserved.
include_recipe 'poise-python'
include_recipe 'apt::default'
#include_recipe 'supervisord'
# include_recipe 'gunicorn'

python_runtime '2'
python_virtualenv '/.virtualenvs/settings/'

directory '/.virtualenvs/settings/' do
	mode '777'
	action :create
end

# python_package 'Django' do
#   version '1.8'
# end

application '/srv/settings' do
  #virtualenv
  git "#{node[:settings][:repository_name]}" do
    deploy_key "#{node[:settings][:deploy_key]}"
    revision "#{node[:settings][:revision]}"
  end
  pip_requirements
end

# Start
execute 'guni' do
	cwd '/srv/settings'
	command '/.virtualenvs/settings/bin/gunicorn manage:app --bind 0.0.0.0:8000 --daemon'
end
