FROM composer:1.10.4

# composer:1.10.4
#   https://github.com/composer/docker/blob/master/1.10/Dockerfile
#   based on php:7-alpine
#     https://github.com/docker-library/php/blob/master/7.4/alpine3.11/cli/Dockerfile
#     based on alpine:3.11

# Package Dependencies:
#   serverless
#     docker
#   awscli
#     groff
# hirak/prestissimo: accelerates installing Composer dependencies
# yarn: npm alternative
# groff: needed by the AWS cli
RUN adduser -D -G users -h /home/app app \
    && composer global require hirak/prestissimo \
    && apk add --no-cache \
        docker=19.03.5-r0 \
        yarn=1.19.2-r0 \
        groff=1.22.4-r0 \
    && yarn global add serverless@1.67.0 \
    && pip3 install \
        --progress-bar off \
        --no-cache-dir \
        --disable-pip-version-check \
        awscli==1.18.39

USER app
ENV PATH=$PATH:/tmp/vendor/bin \
    COMPOSER_ALLOW_SUPERUSER=0 \
    COMPOSER_HOME=/app/.composer
VOLUME /app
VOLUME /home/app/.aws
VOLUME /var/run/docker.sock
WORKDIR /app

ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]
