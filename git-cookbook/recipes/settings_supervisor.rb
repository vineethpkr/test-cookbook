supervisord_program "app" do
  command "/.virtualenvs/settings/bin/gunicorn main:app --bind 0.0.0.0:8000"
  directory '/srv/settings/'
  autostart true
  autorestart true
  user 'nobody'
  stdout_logfile '/tmp/gunicorn.log'
end
