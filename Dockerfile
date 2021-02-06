# Fedora 33 Base Image https://hub.docker.com/_/fedora
FROM fedora:33

# Download Remi PHP Repo https://rpms.remirepo.net/
RUN curl -# -o remi-33.rpm http://rpms.remirepo.net/fedora/remi-release-33.rpm

# Create Application Dir
RUN mkdir /var/www/html/web/application -p

# Update System
RUN dnf -y update && dnf -y install remi-33.rpm httpd dnf-plugin-config-manager supervisor && dnf clean all

# Install Tools while building Container
# RUN dnf -y install net-tools procps vim 

# Enable Remi Repo
RUN dnf config-manager --set-enabled remi

# Install Phalcon Framework
# RUN dnf -y install php56-php-phalcon3 php70-php-phalcon3 php71-php-phalcon3 php72-php-phalcon4 php73-php-phalcon4 php74-php-phalcon4

# Install PHP 5.6
# RUN dnf -y install php56 php56-php-bcmath php56-php-fpm php56-php-gd php56-php-imap php56-php-intl php56-php-ldap php56-php-mbstring php56-php-mysqlnd php56-php-opcache \\ 
# php56-php-pdo php56-php-pecl-imagick php56-php-pecl-mongodb php56-php-pecl-xdebug php56-php-pecl-zip php56-php-soap php56-php-tidy php56-php-xml php56-xhprof

# Install PHP 7.0
# RUN dnf -y install php70 php70-php-ast php70-php-bcmath php70-php-fpm php70-php-gd php70-php-imap php70-php-intl php70-php-ldap php70-php-mbstring php70-php-mysqlnd php70-php-opcache \\ 
# php70-php-pdo php70-php-pecl-imagick php70-php-pecl-mongodb php70-php-pecl-mysql php70-php-pecl-xdebug php70-php-pecl-zip php70-php-soap php70-php-sodium php70-php-tidy php70-php-xml php70-xhprof

# Install PHP 7.1
# RUN dnf -y install php71 php71-php-ast php71-php-bcmath php71-php-fpm php71-php-gd php71-php-imap php71-php-intl php71-php-ldap php71-php-mbstring php71-php-mysqlnd php71-php-opcache \\ 
# php71-php-pdo php71-php-pecl-imagick php71-php-pecl-mongodb php71-php-pecl-mysql php71-php-pecl-xdebug php71-php-pecl-zip php71-php-soap php71-php-sodium php71-php-tidy php71-php-xml php71-xhprof

# Install PHP 7.2
# RUN dnf -y install php72 php72-php-ast php72-php-bcmath php72-php-fpm php72-php-gd php72-php-imap php72-php-intl php72-php-ldap php72-php-mbstring php72-php-mysqlnd php72-php-opcache \\ 
# php72-php-pdo php72-php-pecl-imagick php72-php-pecl-mcrypt php72-php-pecl-mongodb php72-php-pecl-mysql php72-php-pecl-xdebug php72-php-pecl-zip php72-php-soap php72-php-sodium php72-php-tidy php72-php-xml php72-xhprof

# Install PHP 7.3
# RUN dnf -y install php73 php73-php-ast php73-php-bcmath php73-php-fpm php73-php-gd php73-php-imap php73-php-intl php73-php-ldap php73-php-mbstring php73-php-mysqlnd php73-php-opcache \\ 
# php73-php-pdo php73-php-pecl-imagick php73-php-pecl-mcrypt php73-php-pecl-mongodb php73-php-pecl-mysql php73-php-pecl-xdebug php73-php-pecl-zip php73-php-soap php73-php-sodium php73-php-tidy php73-php-xml php73-xhprof

# Install PHP 7.4
RUN dnf -y install php74 php74-php-ast php74-php-bcmath php74-php-fpm php74-php-gd php74-php-imap php74-php-intl php74-php-ldap php74-php-mbstring php74-php-mysqlnd php74-php-opcache \\ 
php74-php-pdo php74-php-pecl-imagick php74-php-pecl-mcrypt php74-php-pecl-mongodb php74-php-pecl-mysql php74-php-pecl-xdebug php74-php-pecl-zip php74-php-soap php74-php-sodium \\ 
php74-php-tidy php74-php-xml php74-xhprof php74-php-phalcon4

# Install PHP 8.0
# RUN dnf -y install php80 php80-php-ast php80-php-bcmath php80-php-fpm php80-php-gd php80-php-imap php80-php-intl php80-php-ldap php80-php-mbstring php80-php-mysqlnd php80-php-opcache \\ 
# php80-php-pdo php80-php-pecl-imagick php80-php-pecl-mcrypt php80-php-pecl-mongodb php80-php-pecl-xdebug php80-php-pecl-zip php80-php-soap php80-php-sodium php80-php-tidy php80-php-xml php80-xhprof

# Copy PHP-FPM Config Files
# COPY .docker/php56/www.conf /etc/opt/remi/php56/php-fpm.d/www.conf
# COPY .docker/php70/www.conf /etc/opt/remi/php70/php-fpm.d/www.conf
# COPY .docker/php71/www.conf /etc/opt/remi/php71/php-fpm.d/www.conf
# COPY .docker/php72/www.conf /etc/opt/remi/php72/php-fpm.d/www.conf
# COPY .docker/php73/www.conf /etc/opt/remi/php73/php-fpm.d/www.conf
COPY .docker/php74/www.conf /etc/opt/remi/php74/php-fpm.d/www.conf
# COPY .docker/php80/www.conf /etc/opt/remi/php80/php-fpm.d/www.conf

# Copy PHP INI Files
# COPY .docker/php56/php.ini /etc/opt/remi/php56/php.ini
# COPY .docker/php70/php.ini /etc/opt/remi/php70/php.ini
# COPY .docker/php71/php.ini /etc/opt/remi/php71/php.ini
# COPY .docker/php72/php.ini /etc/opt/remi/php72/php.ini
# COPY .docker/php73/php.ini /etc/opt/remi/php73/php.ini
COPY .docker/php74/php.ini /etc/opt/remi/php74/php.ini
# COPY .docker/php80/php.ini /etc/opt/remi/php80/php.ini

# Copy Apache VirtualHost Config
COPY .docker/httpd/welcome.conf /etc/httpd/conf.d/welcome.conf
COPY .docker/httpd/z-hostname.conf /etc/httpd/conf.d/z-hostname.conf

# Set User Permissions
RUN usermod -u 1000  apache && groupmod -g 1000 apache && chown apache:apache -R /var/www/html/web

# Copy Entrypoint
COPY .docker/entrypoint.sh /entrypoint.sh

# Copy Supervisor
COPY .docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose on Port 80
EXPOSE 80

# Execute Entrypoint
# ENTRYPOINT ["/entrypoint.sh"]

# Execute Supervisor
CMD ["/usr/bin/supervisord","-c","/etc/supervisor/conf.d/supervisord.conf"]

