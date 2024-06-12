#!/usr/bin/env bash

wp --allow-root config create \
	--path=/var/www/html \
	--dbname="$WORDPRESS_DATABASE" \
	--dbuser="$WORDPRESS_USER" \
	--dbpass="$WORDPRESS_PASSWORD" \
	--dbhost=mariadb \
	--dbprefix="wp_"

wp core install --allow-root \
	--path=/var/www/html \
	--title="Inception" \
	--url=vde-frei.42.fr \
	--admin_user=$WORDPRESS_USER \
	--admin_password=$WORDPRESS_PASSWORD \
	--admin_email=user@email.com

# Install redis plugin
wp plugin install --allow-root redis-cache --path=/var/www/html/

# Configure WordPress
wp config set WP_CACHE true --add --type=constant --allow-root --path=/var/www/html/

# Configure Redis Cache
wp config set WP_REDIS_PORT 6379 --add --type=constant --allow-root --path=/var/www/html/
wp config set WP_REDIS_HOST redis --add --type=constant --allow-root --path=/var/www/html/

wp plugin activate --allow-root redis-cache --path=/var/www/html/
wp redis enable --allow-root --path=/var/www/html/

# Enable Redis Cache after Database is ready
while ! wp db check --allow-root --path=/var/www/html/; do
	echo "Waiting for Database to be ready..."
	sleep 1
done

exec php-fpm7.4 -F
