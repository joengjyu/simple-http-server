FROM alpine

MAINTAINER joengjyu
LABEL author="joengjyu@gmail.com"

WORKDIR /app

COPY ./bin/simple-http-server /app

EXPOSE 80 80

CMD ["/app/simple-http-server"]