FROM alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache ca-certificates

ADD bin/server /bin/server
ADD configs /configs/

EXPOSE 8000
EXPOSE 9000

ENTRYPOINT [ "/bin/server", "-conf", "/configs/config.yaml"]
