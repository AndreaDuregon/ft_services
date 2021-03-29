# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aduregon <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/28 17:50:56 by aduregon          #+#    #+#              #
#    Updated: 2021/03/29 12:15:54 by aduregon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

EXPOSE	3306

RUN		apk add --update
RUN		apk add mysql mysql-client

COPY	init_file ./
COPY	wordpress.sql ./
COPY	my.cnf ./

RUN     mkdir /run/mysqld/
RUN		mv my.cnf /etc/

COPY    setup.sh ./setup.sh
RUN		chmod 755 ./setup.sh

ENTRYPOINT		./setup.sh