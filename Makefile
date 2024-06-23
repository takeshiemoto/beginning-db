# Makefile

.PHONY: up down init clean

# Docker Composeファイルのパス
COMPOSE_FILE = docker-compose.yml

# コンテナを起動する（データベースを更新しない）
up:
	docker-compose -f $(COMPOSE_FILE) up -d

# コンテナを停止する
down:
	docker-compose -f $(COMPOSE_FILE) down

# コンテナを削除して再作成し、init.sqlを再実行する
init: clean
	docker-compose -f $(COMPOSE_FILE) up -d

# コンテナ、イメージ、ボリュームを完全に削除して再作成する
clean:
	docker-compose -f $(COMPOSE_FILE) down -v --rmi all --remove-orphans
	docker system prune -f --volumes
