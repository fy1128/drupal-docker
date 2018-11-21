FROM drupal:8.6-fpm-alpine

ARG DEBIAN_FRONTEND=noninteractive
# Deploy files
ADD entrypoint.sh /opt/
ADD setup.env /opt/
RUN cat /opt/setup.env >> ~/.profile
RUN set -eux; \
	\
	chmod a+x /opt/entrypoint.sh; \
	mkdir -p ~/.drush \
	;

# System dependencies
RUN set -eux; \
	\
	apk update; \
	apk add --no-cache \
		unzip \
		git \
	;

COPY drush.ini php.ini ~/.drush/
		
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin -- --filename=composer

# Composer addons
RUN composer global require consolidation/cgr

# Config

# Drush, DrupalConsole
WORKDIR /var/www/html
RUN set -eux; \
	. ~/.profile \
	&& cgr drush/drush \ 
	&& composer require drupal/console:~1.0 \
	--prefer-dist \
	--optimize-autoloader \
	;

# Clean trash.
RUN  rm -rf /var/lib/apt/lists/* && \
     rm -rf /var/cache/apk/* 

#ENTRYPOINT ["/opt/entrypoint.sh"]

