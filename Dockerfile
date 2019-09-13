FROM php:7
​
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
&& apt update && apt install -y git ssh apache2-utils nodejs python3-pip && rm -rf /var/lib/apt/lists/*
​
RUN curl -sS https://getcomposer.org/installer | php &&\
mv composer.phar /usr/local/bin/composer &&\
chmod +x /usr/local/bin/composer
​
RUN pip3 install --upgrade --user awscli && echo 'export PATH=/root/.local/bin:$PATH'>/root/.bashrc
RUN npm install -g serverless
​
