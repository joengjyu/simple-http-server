FROM alpine:3.16

MAINTAINER joengjyu
LABEL author="joengjyu@gmail.com"

WORKDIR /app

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
     && apk add --no-cache bash bash-doc bash-completion curl wget net-tools iputils iproute2 netcat-openbsd busybox-extras tcpdump lsblk bind-tools

RUN adduser -G users -u 1000 -s /bin/bash -h /app -D joeng

USER joeng

COPY ./bin/simple-http-server /app

EXPOSE 80 80

CMD ["/app/simple-http-server"]