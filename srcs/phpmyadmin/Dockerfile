FROM    alpine


EXPOSE  5000


RUN     apk update && apk add wget && apk add nginx

RUN     apk add php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom


RUN     mkdir -p /usr/share/webapps/
RUN		mkdir /www
RUN		mkdir /run/nginx
COPY	nginx.conf ./etc/nginx/nginx.conf

RUN     cd /usr/share/webapps
RUN     wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN     tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN     rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN     mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN     cd

RUN     chmod -R 777 /usr/share/webapps/


RUN     ln -s /usr/share/webapps/phpmyadmin/ /www/phpmyadmin