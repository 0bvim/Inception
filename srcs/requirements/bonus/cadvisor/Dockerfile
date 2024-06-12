FROM debian:oldstable

RUN apt -y update -y && apt upgrade -y
RUN apt install wget -y

WORKDIR		/usr/local/bin

RUN wget https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64
RUN mv cadvisor-v0.49.1-linux-amd64 cadvisor
RUN chmod +x cadvisor

ENTRYPOINT [ "cadvisor" ]
