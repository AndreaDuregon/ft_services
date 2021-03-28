# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aduregon <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/28 17:50:56 by aduregon          #+#    #+#              #
#    Updated: 2021/03/28 18:16:11 by aduregon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk update
RUN		apk add mysql mysql-client

COPY    srcs/wordpress.sql /tmp
RUN     service mysql start && mysql -u root < /tmp/wordpress.sql

COPY    setup.sh ./setup.sh
RUN		chmod 755 ./setup.sh
ENTRYPOINT		./setup.sh