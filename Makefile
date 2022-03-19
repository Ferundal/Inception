# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cjettie <cjettie@21-school.ru>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#                                                      #+#    #+#              #
#                                                     ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER-COMPOSE_YML=		srcs/docker-compose.yml

DOCKER-COMPOSE_YML_B=

all:					inception

inception:				build up

bonus:

build:
						docker-compose -f ${DOCKER-COMPOSE_YML} build

up:
						docker-compose -f ${DOCKER-COMPOSE_YML} up -d

ps:
						docker-compose -f ${DOCKER-COMPOSE_YML} ps

stop:
						docker-compose -f ${DOCKER-COMPOSE_YML} stop

restart:				stop up

rebuild:				clean build up

clean:
						docker-compose -f ${DOCKER-COMPOSE_YML} down

fclean:
						docker-compose -f ${DOCKER-COMPOSE_YML} down --volumes

.PHONY:					all inception bonus up ps stop re clean fclean