# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aduregon <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/27 12:43:18 by aduregon          #+#    #+#              #
#    Updated: 2021/03/27 16:01:39 by aduregon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

EXPOSE	80 443

RUN		apk update && apk add nginx
RUN		apk add php7-gd php7-mysqli php7-zlib php7-curl
RUN		apk add openssl openssh --no-cache
RUN		apk add wget

COPY	./wordpress ./var/www/localhost/wordpress
COPY	./wp-config.php /var/www/localhost/wordpress

RUN		chmod -R 755 var/www/*
RUN		mkdir /run/nginx
RUN		mkdir /etc/nginx/ssl

COPY	nginx.conf ./etc/nginx/nginx.conf

RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=IT"	

RUN		mkdir /etc/nginx/sites-available
RUN		mkdir /etc/nginx/sites-enabled
COPY	nginx.conf /etc/nginx/sites-available
RUN		ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf
RUN		rm -rf /etc/nginx/sites-enabled/default



