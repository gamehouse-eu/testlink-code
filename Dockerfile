# Use the latest version of Ubuntu
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Update the repository sources list
RUN apt-get update -y

# Install Apache, PHP
RUN apt-get install -y vim apache2 php php-gd php-curl libapache2-mod-php php-mysql php8.1-mbstring

RUN sed -i 's/max_execution_time = .*/max_execution_time = 120/' /etc/php/8.1/apache2/php.ini
RUN sed -i 's/session.gc_maxlifetime = .*/session.gc_maxlifetime = 2400/' /etc/php/8.1/apache2/php.ini

# RUN sed -i 's/;extension=curl/extension=curl/' /etc/php/8.1/cli/php.ini

# Expose apache
EXPOSE 80

# Copy site into place.
# ADD www/ /var/www/html
WORKDIR /var/www/public
COPY . ./

RUN mkdir -p /var/testlink/logs/
RUN chmod -R 777 /var/testlink/logs/

RUN mkdir -p /var/testlink/upload_area/
RUN chmod -R 777 /var/testlink/upload_area/

RUN chmod -R 777 /var/www/public/gui/templates_c

# Update the default apache site with the config we created.
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# By default, simply start apache.
CMD /usr/sbin/apache2ctl -D FOREGROUND
