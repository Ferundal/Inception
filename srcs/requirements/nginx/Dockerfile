FROM    debian:buster

#LABEL  maintainer = <cjettie@student.21-school.ru>

RUN     apt-get update -y && \
	    apt-get	upgrade -y

RUN     apt-get install -y wget \
                        vim

RUN     apt-get install -y nginx \
                        openssl

RUN 	rm -rf ./etc/nginx/sites-available/default
RUN 	rm -rf ./etc/nginx/sites-enabled/default

COPY    tools/nginx.conf ./etc/nginx/sites-available
RUN     ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

RUN     mkdir /etc/nginx/ssl
RUN     mkdir /etc/nginx/ssl/certs
RUN     mkdir /etc/nginx/ssl/private

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048		\
		-keyout /etc/nginx/ssl/private/cjettie.key 				\
		-out /etc/nginx/ssl/certs/cjettie.crt					\
		-subj "/C=RU/ST=Georgia/L=Batumi/O=school21/OU=7wave/CN=cjettie"

RUN     chmod -R 755 /etc/nginx/ssl/*

EXPOSE  443

CMD ["nginx", "-g", "daemon off;"]