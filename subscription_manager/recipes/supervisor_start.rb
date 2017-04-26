Chef::Log.info 'Start or restart supervisord'

execute 'Start Supervisor' do
    command "source /.virtualenvs/supervisor_env/bin/activate && supervisord -c /etc/supervisord.conf"
    not_if do ::File.exist?('/etc/supervisord.pid') end
end
