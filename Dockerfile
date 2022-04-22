FROM nginx:alpine

#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add --update --no-cache --virtual .build-dependencies shadow && \
    usermod -u 1000 nginx && groupmod -g 1000 nginx && \
    apk del .build-dependencies && rm -rf /tmp/*
