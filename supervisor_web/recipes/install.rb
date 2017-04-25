python_runtime '2'
#python_virtualenv '/.virtualenvs/settings/'


Chef::Log.info 'installing supervisor'

execute 'install supervisor' do
    command 'source /.virtualenvs/social_tab_3/bin/activate && pip install supervisor && pip install superlance'
end


execute 'create conf file' do
    command 'touch /var/tmp/supervisor/supervisord.conf'
end