PHONY: help

help:
	@echo ""
	@echo "# PROJECT"
	@echo "build     build database and server containers"
	@echo "run       run project in background"
	@echo "log       log only server"
	@echo "log-all   log server and database"
	@echo "in        get into server's shell"
	@echo "black     blackify .py"
	@echo ""
	@echo "# DJANGO"
	@echo "req       update requirements following requirements.txt"
	@echo ""
	@echo "# REACT"
	@echo "runjs     start frontend dev server"
	@echo "prettier  prettify .js"
	@echo ""


build:
	@docker-compose build

run:
	@docker-compose up -d

down:
	@docker-compose down  --remove-orphans

logs:
	@docker-compose logs -f backend

logs-all:
	@docker-compose logs -f backend

req:
	@docker-compose run backend pip install -r backend/requirements/dev.txt

in:
	@docker-compose run backend /bin/sh

runjs:
	@npm run start --prefix frontend

prettier:
	@npm --prefix frontend run prettier

urls:
	@docker-compose exec backend /code/backend/manage.py show_urls

black:
	@docker-compose run backend black /code/backend

tu:
	@docker-compose run backend pytest /code/backend