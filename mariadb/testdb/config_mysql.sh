#!/bin/bash

__create_mysql_database() {
  echo "Running the create_mysql_database function."

  . mysql_db.conf

  /etc/init.d/mysql start

  echo "Creating Database $DB_NAME" 
  mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE $DB_NAME character set $DB_CHARACTER_SET collate $DB_COLLATE_RULE;"
  echo "Database $DB_NAME is created"

  echo "Creating user $DB_LOCAL_USER" 
  mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_LOCAL_USER'@'localhost' IDENTIFIED BY '$DB_LOCAL_PASSWORD'; FLUSH PRIVILEGES;"
  echo "User $DB_LOCAL_USER is created"

  echo "Creating user $DB_REMOTE_USER and allowed at host $DB_REMOTE_ALLOWED_HOST"
  mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_REMOTE_USER'@'$DB_REMOTE_ALLOWED_HOST' IDENTIFIED BY '$DB_REMOTE_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
  echo "User $DB_REMOTE_USER is created"

  /etc/init.d/mysql stop

  sleep 10
}

# Call all functions
__create_mysql_database
