#!/bin/sh
set -e

echo "Deploying drupal rootfs"
webroot="/var/www/html"
cd $webroot
if [ "$(ls -A rootfs | grep -v '.fl')" ]; then
	cd $webroot
	for f in $(ls -A rootfs)
	do
		[ -f $f ] && rm -f $f
		ln -s rootfs/$f $f
	done
else
	for f in $(cat rootfs/.fl)
	do
		[ -f $f ] \
			&& mv $f rootfs \
			&& ln -s rootfs/$f $f
	done
fi

php-fpm

