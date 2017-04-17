# execute "get_supervisor" do
#   command "sudo easy_install supervisor"
#   #command "echo_supervisord_conf > /etc/supervisord.conf"
# end
include_recipe 'poise_monit::default'


poise_service 'supervisor_settings' do
  command '/.virtualenvs/settings/bin/gunicorn /srv/settings/manage:app --bind 0.0.0.0:8000'
  stop_signal 'WINCH'
  reload_signal 'USR1'
  provider :monit
  #options :monit, checks: 'if failed host localhost port 80 protocol HTTP request "/" then restart'
end


# supervisord_program "app" do
#   command "/.virtualenvs/settings/bin/gunicorn manage:app --bind 0.0.0.0:8000"
#   directory '/srv/settings/'
#   autostart true
#   autorestart true
#   user 'nobody'
#   stdout_logfile '/tmp/gunicorn.log'
# end
