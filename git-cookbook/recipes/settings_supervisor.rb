# execute "get_supervisor" do
#   command "sudo easy_install supervisor"
#   #command "echo_supervisord_conf > /etc/supervisord.conf"
# end

supervisord_program "app" do
  command "/.virtualenvs/settings/bin/gunicorn manage:app --bind 0.0.0.0:8000"
  directory '/srv/settings/'
  autostart true
  autorestart true
  user 'nobody'
  stdout_logfile '/tmp/gunicorn.log'
end
