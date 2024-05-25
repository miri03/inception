#!/bin/sh

service mariadb start

sleep 4

mariadb -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mariadb -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS mydatabase;"

mariadb -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"

mariadb -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON mydatabase.* TO '$MYSQL_USER'@'localhost';"

# mariadb -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON mydatabase.* TO '$MYSQL_USER'@'wordpress-container.srcs_my_network' IDENTIFIED BY '$MYSQL_USER_PASSWORD' WITH GRANT OPTION;"

mariadb -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

mysqladmin -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD  shutdown

mysqld

# wp-cli wordpress