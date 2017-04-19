python_runtime '2'

poise_service 'flask_check' do
  command '/.virtualenvs/social_tab/bin/gunicorn main:app --bind 127.0.0.1:5090'
  directory '/srv/flask_test/test_flask'
  stop_signal 'WINCH'
  reload_signal 'USR1'
  provider :monit
  #options :monit, checks: 'if failed host localhost port 80 protocol HTTP request "/" then restart'
end
