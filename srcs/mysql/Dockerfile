# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: simonegiovo <simonegiovo@student.42.fr>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/28 17:50:56 by aduregon          #+#    #+#              #
#    Updated: 2021/03/29 02:02:37 by simonegiovo      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk add --update
RUN     mkdir /var/run/mysqld/
RUN		apk add mysql mysql-client
COPY    setup.sh ./setup.sh
RUN		chmod 755 ./setup.sh

#ENTRYPOINT		./setup.sh