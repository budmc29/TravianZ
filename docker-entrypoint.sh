#!/bin/bash
# ABOUTME: Docker entrypoint script that sets correct file permissions
# ABOUTME: before starting Apache web server

set -e

# Set proper ownership and permissions for directories that need write access
echo "Setting file permissions..."

# The parent directory needs to be owned by www-data for renaming install/
chown -R www-data:www-data /var/www/html

# Make parent directory writable (needed to rename install/ directory after installation)
chmod 775 /var/www/html

# Make install directory writable
chmod -R 775 /var/www/html/install

# Make var directory writable (needed for installed marker file and other runtime files)
chmod -R 775 /var/www/html/var

# Make GameEngine writable (needed for config.php generation)
chmod -R 775 /var/www/html/GameEngine

echo "Permissions set successfully"

# Execute the original docker-php-entrypoint with apache
exec docker-php-entrypoint apache2-foreground
