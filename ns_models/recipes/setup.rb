# Copyright (c) 2017 The Authors, All Rights Reserved.
include_recipe 'poise-python'
include_recipe 'apt::default'
#include_recipe 'supervisord'
# include_recipe 'gunicorn'

python_runtime '2'
python_virtualenv '/.virtualenvs/ns_models/'

yum_package 'gcc'
yum_package 'libffi-devel'
yum_package 'python-devel'
yum_package 'openssl-devel'


directory '/.virtualenvs/ns_models/' do
	mode '777'
	action :create
end

execute 'access' do
	command 'sudo chmod -R 777 /.virtualenvs/noise_api/'
end

# python_package 'Django' do
#   version '1.8'
# end

application '/srv/ns_models' do
  #virtualenv
  git "#{node[:ns_models][:repository_name]}" do
    deploy_key "#{node[:settings][:deploy_key]}"
    revision "#{node[:ns_models][:revision]}"
  end
  pip_requirements
end

template "/srv/ns_models/Utils/config.py" do
  source "ns_models_conf.erb"
  owner "root"
  group "root"
  mode "0755"
end