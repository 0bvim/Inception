FROM debian:oldstable

ARG WORDPRESS_DATABASE
ARG WORDPRESS_USER
ARG WORDPRESS_PASSWORD

WORKDIR /var/www/html/

RUN apt update -y && \
    apt upgrade -y && \
    apt install php7.4 php-fpm php-mysql mariadb-client wget -y

RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x /usr/local/bin/wp \
	&& wp core download --allow-root --path=/var/www/html

# Create the directory where php-fpm will store the pid file
RUN mkdir /run/php

RUN chown -R www-data:www-data /var/www/html \
	&& chmod 755 /var/www/html

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tool/script.sh /tmp/wp_setup.sh

RUN chmod +x /tmp/wp_setup.sh

ENTRYPOINT ["/tmp/wp_setup.sh"]
