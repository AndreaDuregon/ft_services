# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aduregon <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/26 10:59:39 by aduregon          #+#    #+#              #
#    Updated: 2021/03/28 17:27:16 by aduregon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

EXPOSE	80 443 22

RUN		apk update && apk add nginx
RUN		apk add openssl openssh --no-cache

RUN		mkdir /www
RUN		mkdir /run/nginx
RUN		mkdir /etc/nginx/ssl
COPY	nginx.conf ./etc/nginx/nginx.conf

RUN		adduser -D user
RUN		echo "user:password"|chpasswd
RUN 	ssh-keygen -A

RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=IT"	

COPY    setup.sh ./setup.sh
RUN		chmod 755 ./setup.sh
ENTRYPOINT		./setup.sh

