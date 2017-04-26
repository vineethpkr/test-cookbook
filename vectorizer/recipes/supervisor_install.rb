python_runtime '2'
#python_virtualenv '/.virtualenvs/settings/'


Chef::Log.info 'Installing supervisor'
execute 'install supervisor' do
    command 'source /.virtualenvs/vectorizer/bin/activate && pip install supervisor && pip install superlance'
end


# Init supervisor file
execute 'create conf file' do
    command 'touch /etc/supervisord.conf'
end

# Add template
template '/etc/supervisord.conf' do
    source 'supervisor_conf.erb'
    owner 'root'
    group 'root'
    mode '0755'
end