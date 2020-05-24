FROM composer:latest

# composer
#   https://github.com/composer/docker/blob/master/1.10/Dockerfile
#   based on php:7-alpine
#     https://github.com/docker-library/php/blob/master/7.4/alpine3.11/cli/Dockerfile
#     based on alpine:3.11

# Package Dependencies:
#   serverless
#     docker
#   awscli
#     groff: needed by the AWS cli
#   hirak/prestissimo: accelerates installing Composer dependencies
#   yarn: npm alternative
RUN adduser -D -G users -h /home/app app \
    && composer global require hirak/prestissimo \
    && apk add --no-cache \
        docker \
        yarn \
        groff \
    && yarn global add serverless \
    && pip3 install \
        --progress-bar off \
        --no-cache-dir \
        --disable-pip-version-check \
        awscli

USER app
ENV PATH=$PATH:/tmp/vendor/bin \
    COMPOSER_HOME=/var/task/.composer
VOLUME /var/task
VOLUME /home/app/.aws
VOLUME /var/run/docker.sock
WORKDIR /var/task
