# Copyright (c) 2017 The Authors, All Rights Reserved.
include_recipe 'poise-python'
include_recipe 'apt::default'
#include_recipe 'supervisord'
# include_recipe 'gunicorn'

python_runtime '2'
python_virtualenv '/.virtualenvs/vectorizer/'

directory '/.virtualenvs/vectorizer/' do
	mode '777'
	action :create
end

# python_package 'Django' do
#   version '1.8'
# end

application '/srv/vectorizer' do
  #virtualenv
  git "#{node[:vectorizer][:repository_name]}" do
    deploy_key "#{node[:settings][:deploy_key]}"
    revision "#{node[:vectorizer][:revision]}"
  end
  pip_requirements
end