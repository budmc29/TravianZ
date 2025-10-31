#!/bin/bash
# ABOUTME: Docker entrypoint script that sets correct file permissions
# ABOUTME: before starting Apache web server

set -e

# Set proper ownership and permissions for directories that need write access
echo "Setting file permissions..."

# Directories that need write access
chown -R www-data:www-data /var/www/html/install
chown -R www-data:www-data /var/www/html/var
chown -R www-data:www-data /var/www/html/GameEngine

# Make install directory writable (needed to rename it after installation)
chmod -R 775 /var/www/html/install

# Make var directory writable (needed for installed marker file and other runtime files)
chmod -R 775 /var/www/html/var

# Make GameEngine writable (needed for config.php generation)
chmod -R 775 /var/www/html/GameEngine

echo "Permissions set successfully"

# Execute the original docker-php-entrypoint with apache
exec docker-php-entrypoint apache2-foreground
