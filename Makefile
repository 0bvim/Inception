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

	if [ ! -f ./srcs/.env ]; then \
		wget -O srcs/.env https://raw.githubusercontent.com/0bvim/Inception/main/srcs/.env; \
	fi

