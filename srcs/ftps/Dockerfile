# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aduregon <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/27 12:34:46 by aduregon          #+#    #+#              #
#    Updated: 2021/03/27 12:39:14 by aduregon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

EXPOSE	21

RUN		apk update && apk add vsftpd

COPY    start.sh ./start.sh
RUN		chmod 755 ./start.sh
CMD		sh start.sh