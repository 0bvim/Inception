# Define color variables
RED := \033[0;31m
YELLOW := \033[0;33m
BLUE := \033[0;34m
GREEN := \033[0;32m
NO_COLOR := \033[0m

LOGIN=vde-frei
MARIADB_DIR=/home/${LOGIN}/data/mariadb
WORDPRESS_DIR=/home/${LOGIN}/data/wordpress

all: pre_build


pre_build:
	@echo "\n${RED}Starting configuration and building dependencies${NO_COLOR}"
	@echo "\n${BLUE}Injecting .env file in srcs directory."

	# downloading .env information.
	if [ ! -f ./srcs/.env ]; then \
		wget -O srcs/.env https://raw.githubusercontent.com/0bvim/Inception/main/srcs/.env; \
	fi

	# inserting login extension to local hosts as required.
	if ! grep -q '${LOGIN}' /etc/hosts; then \
		echo "127.0.0.1 ${LOGIN}.42.fr" | sudo tee -a /etc/hosts > /dev/null; \
	fi

	# adding directories to user
	if [ ! -d "${WORDPRESS_DIR}" ]; then \
		sudo mkdir -p ${WORDPRESS_DIR}; \
	fi

	if [ ! -d "${MARIADB_DIR}" ]; then \
		sudo mkdir -p ${MARIADB_DIR}; \
	fi

DOCKER_COMP_FILE=srcs/docker-compose.yml
DOCKER_COMP_CMD=docker compose -f ${DOCKER_COMP_FILE}
