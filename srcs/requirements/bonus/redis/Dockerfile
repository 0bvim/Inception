FROM debian:oldstable

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y redis

COPY ./tool/redis.sh /tmp/redis.sh

EXPOSE 6379

CMD ["sh", "/tmp/redis.sh"]
