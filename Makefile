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

include srcs/.env
export

DOCKER-COMPOSE_YML=		srcs/docker-compose.yml

DOCKER-COMPOSE_YML_B=

all:					inception

inception:				build up

bonus:

build:					make_volumes_dirs add_record_to_host_file
						docker-compose -f ${DOCKER-COMPOSE_YML} build

up:
						docker-compose -f ${DOCKER-COMPOSE_YML} up -d

ps:
						docker-compose -f ${DOCKER-COMPOSE_YML} ps

stop:
						docker-compose -f ${DOCKER-COMPOSE_YML} stop

down:
						docker-compose -f ${DOCKER-COMPOSE_YML} down

add_record_to_host_file:
						sed -ie '/\(${SITE_NAME}\)/! s/127.0.0.1.*/&	${SITE_NAME}/' /etc/hosts

make_volumes_dirs:
						mkdir -p ${VOLUMES_DIR}/${VOLUME_DB_DIR_NAME} ${VOLUMES_DIR}/${VOLUME_WP_DIR_NAME}

restart:				stop up

rebuild:				clean build up

clean:
						docker-compose -f ${DOCKER-COMPOSE_YML} down

fclean:
						docker-compose -f ${DOCKER-COMPOSE_YML} down --volumes
						rm -rf ${VOLUMES_DIR}/${VOLUME_DB_DIR_NAME} ${VOLUMES_DIR}/${VOLUME_WP_DIR_NAME}
						rm -df ${VOLUMES_DIR}

.PHONY:					all inception bonus up ps stop re clean fclean