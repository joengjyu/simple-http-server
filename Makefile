TAG=$(shell date '+%Y%m%d')
build:
	@GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o bin/simple-http-server main.go

image:build
	@docker build -t ghcr.io/joengjyu/simple-http-server:$(TAG) .

push:image
	@docker push ghcr.io/joengjyu/simple-http-server:$(TAG)