FROM php:7
​
# Install npm
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt update && apt install -y git ssh apache2-utils nodejs python3-pip && rm -rf /var/lib/apt/lists/*
​
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer
​
# Install the `aws` CLI tool
RUN pip3 install --upgrade --user awscli && echo 'export PATH=/root/.local/bin:$PATH'>/root/.bashrc

# Install serverless
RUN npm install -g serverless
​
