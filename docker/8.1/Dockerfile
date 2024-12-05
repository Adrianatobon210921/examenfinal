FROM laravelsail/php81-composer:latest
WORKDIR /var/www/html
COPY . .
RUN composer install
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=80"]

