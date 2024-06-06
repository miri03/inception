all:
	docker compose --project-directory "srcs/" up -d --build

clean :
	
	docker compose --project-directory "./srcs" down -v
	docker rmi -f $(shell docker images -q)

re : clean all

