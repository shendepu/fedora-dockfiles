#!/bin/bash

__mysql_config() {
echo "Running the mysql_config function."

/etc/init.d/mysql start

. mysql.conf

echo "Changing passowrd for mysql root account."
mysqladmin -u root password "$MYSQL_ROOT_PASSWORD"

SECURE_MYSQL=$(expect -c "
 
set timeout 10
spawn mysql_secure_installation
 
expect \"Enter current password for root (enter for none):\"
send \"$MYSQL_ROOT_PASSWORD\r\"
 
expect \"Change the root password?\"
send \"n\r\"
 
expect \"Remove anonymous users?\"
send \"y\r\"
 
expect \"Disallow root login remotely?\"
send \"y\r\"
 
expect \"Remove test database and access to it?\"
send \"y\r\"
 
expect \"Reload privilege tables now?\"
send \"y\r\"
 
expect eof
")  

echo "$SECURE_MYSQL"

/etc/init.d/mysql stop

sleep 10
}


# Call all functions
__mysql_config
