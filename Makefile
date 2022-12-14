TAG=$(shell date '+%Y%m%d')
build:
	@GOOS=linux CGO_ENABLED=0 go build -o bin/simple-http-server main.go

image:build
	@docker build --network=host -t ghcr.io/joengjyu/simple-http-server:$(TAG) .

push:image
	@docker push ghcr.io/joengjyu/simple-http-server:$(TAG)