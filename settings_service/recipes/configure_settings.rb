Chef::Log.info "Creating Database"
execute 'create_db' do
  cwd '/srv/settings'
  command '/.virtualenvs/settings/bin/python manage.py create_db'
end

Chef::Log.info "Creating tables"
execute 'create_tables' do
  cwd '/srv/settings'
  command '/.virtualenvs/settings/bin/python manage.py create_db'
end
