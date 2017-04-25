python_runtime '2'
#python_virtualenv '/.virtualenvs/settings/'


Chef::Log.info 'installing supervisor'

execute 'install supervisor' do
    command 'source /.virtualenvs/social_tab_3/bin/activate && pip install supervisor && pip install superlance'
end


execute 'create conf file' do
    command 'touch /var/tmp/supervisor/supervisord.conf'
end

# application '/srv/settings' do
#   gunicorn do
#     port 8003
#   end
# end


# poise_service 'supervisor_settings' do
#   command '/.virtualenvs/settings/bin/gunicorn /srv/settings/manage:app --bind 0.0.0.0:8000'
#   stop_signal 'WINCH'
#   reload_signal 'USR1'
#   provider :monit
#   #options :monit, checks: 'if failed host localhost port 80 protocol HTTP request "/" then restart'
# end
