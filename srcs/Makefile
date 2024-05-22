all:
	docker compose up -d

clean :
	docker compose down
	docker rmi srcs-mariadb:latest srcs-nginx:latest

re :
	docker compose down
	docker rmi srcs-mariadb:latest srcs-nginx:latest
	docker compose up -d
