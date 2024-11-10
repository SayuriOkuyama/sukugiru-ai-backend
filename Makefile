GOCMD			=	go
GOVET			=	$(GOCMD) vet
GOBUILD		=	$(GOCMD) build
GORETURNS	= goreturns
LINTER		=	golangci-lint
APP				=	dothatch-backend
PLATFORM	=	linux/arm64
ENV				= local
PGURL			=	postgres://default:oa7szhIYHM3A@ep-still-poetry-a4s5bv2z-pooler.us-east-1.aws.neon.tech:5432/verceldb?sslmode=require

.PHONY: test

all:
	make goreturns
	make genmock
	make vet
	make lint-fix
	make test
	make swaggo
	make build-go

validate:
	$(GOFMT) -w -s ./...

goreturns:
	$(GORETURNS) -w .

lint:
	$(LINTER) run

lint-fix:
	$(LINTER) run --fix

vet:
	$(GOVET) ./...

swaggo:
	swag init --parseDependency

build:
	ko publish --local --platform=$(PLATFORM) --base-import-paths .

build-go:
	$(GOBUILD) main.go

run-go:
	set -a && . config/$(ENV).env && set +a && go run main.go

run-air:
	set -a && . config/$(ENV).env && set +a && air

run-memory:
	export DATASTORE=memory && set -a && . config/$(ENV).env && set +a && air

tbls:
	tbls doc --force "$(PGURL)"

api-scan:
	./scripts/api-scan.sh

api-build:
	docker-compose -f docker-compose.local.yml build --no-cache

migrate:
	migrate -path setup/migrations -database $(PGURL) $(action)
