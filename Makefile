ORACLE_FREE_DB_URL="https://download.oracle.com/otn-pub/otn_software/db-free/oracle-database-free-23c-1.0-1.el8.x86_64.rpm"

run:
	docker compose up -d

stop:
	docker compose stop

remove:
	docker compose rm

download-deps:
	rm -f -r deps
	mkdir deps
	cd deps; wget ${ORACLE_FREE_DB_URL}

build:
	docker build . --no-cache

build-with-deps: 
	make download-deps
	make build

build-and-run:
	make build
	docker compose up -d --force-recreate

build-all:
	make download-deps
	make build-and-run
