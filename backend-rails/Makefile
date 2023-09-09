.PHONY: build build-no-cache up down ps app-bash db-bash db-client apply-db

# docker-compose関連のコマンド

build:
	docker compose build

build-no-cache:
	docker compose build --no-cache

up:
	docker compose up

down:
	docker compose down

ps:
	docker compose ps -a


# Node.js関連のコマンド

app-bash:
	docker compose exec web bash

db-bash:
	docker compose exec db bash

# 開発環境だから許されるコマンド
db-client:
	docker compose exec db bash -c "mysql -u root -p"

apply-db:
	docker compose exec web bash -c "ridgepole --config ./config/database.yml --file ./db/Schemafile --apply"
