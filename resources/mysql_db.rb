default_action :nothing

property :db_database, String, required: true
property :db_host, String, required: true
property :db_root_user, String, required: true
property :mysql_root_password, String, required: true

action :run do
  mysql_connection_info = {
    host: db_host,
    username: db_root_user,
    password: mysql_root_password
  }

  mysql_database db_database do
    connection mysql_connection_info
    action :create
  end
end
