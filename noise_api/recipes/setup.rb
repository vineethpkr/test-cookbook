# Copyright (c) 2017 The Authors, All Rights Reserved.
include_recipe 'poise-python'
include_recipe 'apt::default'
#include_recipe 'supervisord'
# include_recipe 'gunicorn'

python_runtime '2'
python_virtualenv '/.virtualenvs/noise_api/'

yum_package 'gcc'
yum_package 'libffi-devel'
yum_package 'python-devel'
yum_package 'openssl-devel'


directory '/.virtualenvs/noise_api/' do
	mode '777'
	action :create
end

execute 'access' do
	command 'sudo chmod -R 777 /.virtualenvs/noise_api/'
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

# Adding logs folder
execute 'add logs' do
	command 'sudo mkdir /srv/noise_api/logs && sudo chmod -R 777 /srv/noise_api/logs/'
end