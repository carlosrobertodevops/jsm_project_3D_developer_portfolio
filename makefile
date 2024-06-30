.PHONY: dev prod dev-down prod-down

dev:
	docker-compose up app-dev -d

prod:
	docker-compose up app-prod -d

dev-down:
	docker-compose down app-dev # && docker rmi $(docker images -a -q) -f

prod-down:
	docker-compose down app-prod # && docker rmi $(docker images -a -q) -f