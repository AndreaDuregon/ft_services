# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: simonegiovo <simonegiovo@student.42.fr>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/28 17:50:56 by aduregon          #+#    #+#              #
#    Updated: 2021/03/30 00:58:46 by simonegiovo      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

EXPOSE	3306

RUN		apk add --update
RUN		apk add mysql mysql-client

COPY	init_file.sql ./

RUN     mkdir /run/mysqld

COPY    setup.sh ./setup.sh
RUN		chmod 755 ./setup.sh

ENTRYPOINT		./setup.sh