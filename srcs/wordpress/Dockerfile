# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: forsili <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/27 12:43:18 by aduregon          #+#    #+#              #
#    Updated: 2021/03/29 15:23:11 by forsili          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

EXPOSE	5050

COPY	start.sh ./

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

CMD		./start.sh



