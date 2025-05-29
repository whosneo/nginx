FROM nginx:alpine

#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

# Install dependencies and adjust user
RUN apk add --update --no-cache shadow && \
    usermod -u 1000 nginx && groupmod -g 1000 nginx && \
    apk del shadow && \
    rm -rf /var/cache/apk/* /tmp/*
