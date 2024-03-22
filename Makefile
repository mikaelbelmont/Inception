SHELL = /bin/bash

all: up

up:
	mkdir -p ~/data/{mysql,wordpress}
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes

stop:
	docker compose -f ./srcs/docker-compose.yml stop

clean: down
		cd ; sudo rm -rf data;

logs:
	docker compose -f ./srcs/docker-compose.yml logs

re: clean up

.PHONY: up down stop clean
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