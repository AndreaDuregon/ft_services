# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: simonegiovo <simonegiovo@student.42.fr>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/26 10:59:39 by aduregon          #+#    #+#              #
#    Updated: 2021/03/30 01:32:40 by simonegiovo      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

EXPOSE	80 443 22

RUN		apk update
RUN		apk add --no-cache nginx
RUN		apk add --no-cache openssl
RUN		apk add --no-cache openssh 

RUN		mkdir /www
COPY    dureg.png /www
RUN		mkdir /run/nginx
RUN		mkdir /etc/nginx/ssl
COPY	nginx.conf ./etc/nginx/nginx.conf

RUN 	ssh-keygen -A
RUN		adduser -D pippo
RUN		echo "pippo:pluto" | chpasswd

RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=IT"

COPY	index.html /www/

COPY    setup.sh ./setup.sh
RUN		chmod 777 ./setup.sh
CMD		./setup.sh

