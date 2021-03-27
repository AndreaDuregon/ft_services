# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aduregon <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/26 10:59:39 by aduregon          #+#    #+#              #
#    Updated: 2021/03/27 12:33:13 by aduregon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

EXPOSE 80 443

RUN		apk update && apk add nginx
RUN		apk add openssl openssh --no-cache

RUN		mkdir /www
RUN		mkdir /www/localhost
RUN		chmod -R 755 /www/*

RUN		chmod 755 etc/nginx/nginx.conf
RUN		mkdir /run/nginx
RUN		mkdir /etc/nginx/ssl
COPY	nginx.conf ./etc/nginx/nginx.conf

RUN		adduser -D user
RUN 	ssh-keygen -A
RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=IT"	

COPY    start.sh ./start.sh
RUN		chmod 755 ./start.sh
CMD		sh start.sh

