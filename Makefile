makeFileDir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

postgres-rewind:
	docker run --name postgres-rewind -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=123456 -d postgres:14.7-alpine3.17
d-start: 
	docker start postgres-rewind
d-stop:
	docker stop postgres-rewind
d-log:
	docker exec -it postgres-rewind psql -U root
d-logs:
	docker logs postgres-rewind
createdb: 
	docker exec -it postgres-rewind createdb --username=root --owner=root rewind
dropdb: 
	docker exec -it postgres-rewind dropdb rewind
minit:
	migrate create -ext sql -dir db/migrations -seq init_schema
mup:
	migrate -path db/migrations -database postgresql://root:123456@localhost:5432/rewind?sslmode=disable -verbose up
mdown:
	migrate -path db/migrations -database postgresql://root:123456@localhost:5432/rewind?sslmode=disable -verbose down
sqlc: 
	docker run --rm -v $(makeFileDir):/src -w /src kjconroy/sqlc generate
.PHONY: postgres-rewind d-start d-stop d-log d-logs createdb dropdb m-init m-up m-down
