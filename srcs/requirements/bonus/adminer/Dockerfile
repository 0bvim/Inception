FROM debian:oldstable

RUN apt update -y && apt upgrade -y
RUN apt -y install wget php7.4 php7.4-fpm

EXPOSE 9000

# Copy Entrypoint script
COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/entrypoint.sh

# Run php-fpm
ENTRYPOINT  [ "bash", "/usr/local/bin/entrypoint.sh" ]
