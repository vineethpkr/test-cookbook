# Copyright (c) 2017 The Authors, All Rights Reserved.
include_recipe 'poise-python'
include_recipe 'apt::default'
#include_recipe 'supervisord'
# include_recipe 'gunicorn'

python_runtime '3'
python_virtualenv '/.virtualenvs/subscription_manager/'

directory '/.virtualenvs/subscription_manager/' do
	mode '777'
	action :create
end

# python_package 'Django' do
#   version '1.8'
# end

# execute 'install deps' do
#   command 'sudo yum install gcc libffi-devel python-devel openssl-devel'
# end

Chef::Log.info "Installing the facebook manager"
application '/srv/facebook_manager' do
  #virtualenv
  git "#{node[:subscription_manager][:facebook_manager][:repository_name]}" do
    deploy_key "#{node[:settings][:deploy_key]}"
    revision "#{node[:subscription_manager][:facebook_manager][:revision]}"
  end
  pip_requirements
end


Chef::Log.info "Installing the GNIP manager"
application '/srv/gnip_manager' do
  #virtualenv
  git "#{node[:subscription_manager][:gnip_manager][:repository_name]}" do
    deploy_key "#{node[:settings][:deploy_key]}"
    revision "#{node[:subscription_manager][:gnip_manager][:revision]}"
  end
  pip_requirements
end


Chef::Log.info "Installing the Twitter DM manager"
application '/srv/twitter_dm_manager' do
  #virtualenv
  git "#{node[:subscription_manager][:twitter_dm_manager][:repository_name]}" do
    deploy_key "#{node[:settings][:deploy_key]}"
    revision "#{node[:subscription_manager][:twitter_dm_manager][:revision]}"
  end
  pip_requirements
end