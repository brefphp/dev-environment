FROM php:7.4

# Install npm
# libzip-dev: for the PHP zip extension (used by Composer)
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt update && apt install -y git ssh apache2-utils nodejs python3-pip libzip-dev && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

# Install the `aws` CLI tool
RUN pip3 install --upgrade --user awscli && echo 'export PATH=/root/.local/bin:$PATH'>/root/.bashrc

# Install serverless
RUN npm install -g serverless

RUN docker-php-ext-install zip pdo_mysql

RUN mkdir -p /var/task

# Register the Serverless and AWS bin directories
ENV PATH="/root/.serverless/bin:/root/.local/bin:${PATH}"

WORKDIR '/var/task​'
