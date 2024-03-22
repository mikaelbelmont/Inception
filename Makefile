SHELL = /bin/bash

all: up

up:
	mkdir -p ~/data/{mysql,wordpress}
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

clean: down
		cd ; sudo rm -rf data;

logs:
	docker compose -f ./srcs/docker-compose.yml logs

re: clean up





# .PHONY: up down stop clean

# all: 
# 	@docker-compose -f ./srcs/docker-compose.yml up

# down:
# 	@docker-compose -f ./srcs/docker-compose.yml down

# re:
# 	@docker-compose -f srcs/docker-compose.yml up --build

# clean:
# 	@docker stop $$(docker ps -qa);\
# 	docker rm $$(docker ps -qa);\
# 	docker rmi -f $$(docker images -qa);\
# 	docker volume rm $$(docker volume ls -q);\
# 	docker network rm inception;\

# .PHONY: all re down clean




# name = simple_nginx_html
# all:
# 	docker-compose -f ./srcs/docker-compose.yml up -d

# build:
# 	docker-compose -f ./srcs/docker-compose.yml up -d --build

# down:
# 	docker-compose -f ./srcs/docker-compose.yml down

# re:	down
# 	docker-compose -f ./srcs/docker-compose.yml up -d --build

# clean: down
# 	docker system prune -a

# fclean:
# 	docker stop $$(docker ps -qa)
# 	docker system prune --all --force --volumes
# 	docker network prune --force
# 	docker volume prune --force

# reset:
# 	docker ps -a -q | xargs -r -n1 -I % docker rm %
# 	docker images -q | xargs -r -n1 -I % docker rmi %

# .PHONY	: all build down re clean fclean reset