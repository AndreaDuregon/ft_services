/usr/bin/mysql_install_db --datadir=/var/lib/mysql
rc-service start mysql
mysql < wordpress.sql
rc-service stop mysql
/usr/bin/mysqld --user=root --init_file=/init_file