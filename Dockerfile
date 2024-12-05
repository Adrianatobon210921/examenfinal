# Usamos una imagen base de PHP con Apache
FROM php:8.1-apache

# Instalar dependencias necesarias para Laravel y Composer
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    git \
    unzip \
    libxml2-dev \
    libicu-dev \
    libzip-dev \
    libxslt-dev \
    libcurl4-openssl-dev \
    && rm -r /var/lib/apt/lists/*

# Habilitar mod_rewrite de Apache
RUN a2enmod rewrite

# Instalar extensiones de PHP necesarias para Laravel
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql intl zip xsl

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copiar los archivos de la aplicación al contenedor
COPY . /var/www/html

# Establecer el directorio de trabajo
WORKDIR /var/www/html

# Instalar las dependencias de Laravel con Composer
RUN composer install --no-interaction --prefer-dist

# Establecer permisos correctos
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Exponer el puerto 80 para la aplicación
EXPOSE 80

# Comando para ejecutar Apache en segundo plano
CMD ["apache2-foreground"]
