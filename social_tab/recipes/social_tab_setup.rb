# Copyright (c) 2017 The Authors, All Rights Reserved.
include_recipe 'poise-python'
include_recipe 'apt::default'
#include_recipe 'supervisord'
# include_recipe 'gunicorn'

python_runtime '3'
python_virtualenv '/.virtualenvs/social_tab_3/'

directory '/.virtualenvs/social_tab_3/' do
	mode '777'
	action :create
end


yum_package 'gcc'
yum_package 'libffi-devel'
yum_package 'python-devel'
yum_package 'openssl-devel'

# python_package 'Django' do
#   version '1.8'
# end

application '/srv/social_tab' do
  #virtualenv
  git "#{node[:social_tab][:repository_name]}" do
    deploy_key "#{node[:settings][:deploy_key]}"
    revision "#{node[:social_tab][:revision]}"
  end
  pip_requirements
end


# template "/etc/monit.d/social_tab.monitrc" do 
#       owner 'root' 
#       group 'root' 
#       mode 0700
#       source "social_tab.monitrc.erb" 
#     end



# execute 'guni' do
# 	cwd '/srv/social_tab_3'
# 	command '/.virtualenvs/social_tab_3/bin/gunicorn falcon_manager.config:app --bind 0.0.0.0:8090 --daemon'
# end
