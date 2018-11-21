# https://github.com/docker-library/httpd/issues/115#issuecomment-434925837
# https://github.com/docker-library/httpd/issues/115
FROM httpd:alpine

ARG DEBIAN_FRONTEND=noninteractive

ENV APACHE_DOCUMENT_ROOT=/var/www/html

# httpd.conf
RUN sed -i \
	#-e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
	#-e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
	-e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
	-e 's/^\(LoadModule .*mod_mpm_prefork.so\)/#\1/' \
	-e 's/^#\(LoadMOdule .*mod_mpm_event.so\)/\1/' \
	-e 's/^#\(LoadMOdule .*mod_slotmem_shm.so\)/\1/' \
        conf/httpd.conf
# DocumentRoot
RUN mkdir -p $APACHE_DOCUMENT_ROOT

# Create /temp_configs_dir for using.
RUN mkdir /temp_configs_dir && chmod -R +x /temp_configs_dir && cd /temp_configs_dir

COPY entrypoint.sh /usr/local/bin/ 
RUN chmod +x /usr/local/bin/entrypoint.sh 

ENTRYPOINT ["entrypoint.sh"]

