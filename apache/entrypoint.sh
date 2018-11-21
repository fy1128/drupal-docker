#!/bin/sh

set -e

# Copy user defined configs from temp folder to existing.
if [ "$(ls -A /temp_configs_dir)" ]; then
	cp -f -R /temp_configs_dir/* /usr/local/apache2/conf/
fi

httpd-foreground

