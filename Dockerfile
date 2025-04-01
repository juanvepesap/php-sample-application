# Usar una imagen base con PHP y Apache
FROM php:7.4-apache

# Instalar dependencias necesarias, por ejemplo, si usas Composer
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Copiar los archivos de la aplicación al contenedor
COPY . /var/www/html/

# Exponer el puerto 80
EXPOSE 80

# Configurar el comando de inicio para Apache
CMD ["apache2-foreground"]


