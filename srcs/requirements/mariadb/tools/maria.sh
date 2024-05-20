#!/bin/sh

service mariadb start

sleep 2

mariadb -u root -p"123" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '123';"

mariadb -u root -p"123" -e "CREATE DATABASE IF NOT EXISTS mydatabase;"

mariadb -u root -p"123" -e "CREATE USER IF NOT EXISTS 

'myuser'@'localhost' IDENTIFIED BY 'mypassword';"

mariadb -u root -p"123" -e "GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser'@'localhost';"

mariadb -u root -p"123" -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p"123"  shutdown
echo "allo"

mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'

# how to config mysqld