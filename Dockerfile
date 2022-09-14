FROM debian:buster

RUN apt update && apt upgrade -y
RUN apt install vim -y && apt install wget -y && apt install mariadb-server -y && apt install nginx -y
RUN apt install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring -y

COPY ./srcs/default /etc/nginx/sites-available/default

WORKDIR /var/www/html

RUN mkdir ssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Russia/L=Kazan/O=21_school/OU=21_kazan/CN=ft_server" \
	-newkey rsa:2048 -keyout ./ssl/selfsigned.key -out ./ssl/selfsigned.crt

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
	tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz && \
	mv phpMyAdmin-5.0.1-english phpmyadmin

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xf latest.tar.gz && rm -rf latest.tar.gz

COPY ./srcs/config.inc.php phpmyadmin/
COPY ./srcs/wp-config.php wordpress/

RUN chown -R www-data:www-data ./*
RUN chmod -R 755 ./*

RUN rm index.nginx-debian.html

COPY ./srcs/*.sh ./
CMD bash start.sh
