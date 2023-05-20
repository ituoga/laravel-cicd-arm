FROM spiksius/php8.1-apache-arm:latest

COPY . /var/www

WORKDIR /var/www
RUN composer install --no-dev

RUN chmod -R 777 /var/www/storage /var/www/bootstrap/cache

RUN sed -i "s/www\/html/www\/public/g" /etc/apache2/sites-enabled/000-default.conf
RUN sed -i "s/upload_max_filesize.*/upload_max_filesize=500M/g" /usr/local/etc/php/php.ini
RUN sed -i "s/post_max_size.*/post_max_size=500M/g" /usr/local/etc/php/php.ini
RUN sed -i "s/memory_limit.*/memory_limit=500M/g" /usr/local/etc/php/php.ini
