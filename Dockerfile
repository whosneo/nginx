FROM nginx:alpine

#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

# Install dependencies and adjust user
RUN set -eux && \
    apk add --no-cache --virtual .usermod shadow && \
    usermod -u 1000 nginx && \
    groupmod -g 1000 nginx && \
    apk del .usermod && \
    rm -rf /tmp/* /var/tmp/*
