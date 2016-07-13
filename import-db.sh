#!/usr/bin/env bash

set -e
BRN='\033[0;33m' # headline

printf "${BRN}========== IMPORTING WP DB ==========${NC}\n\n"

vagrant ssh -c "
printf '»»» checking wp cli version\n' &&
sudo wp cli update --allow-root &&
cd /var/www/public &&
printf '»»» checking db credentials\n' &&
sed -i \"s/'DB_USER', 'wp'/'DB_USER', 'root'/g\" wp-config.php
sed -i \"s/'DB_PASSWORD', 'wp'/'DB_PASSWORD', 'root'/g\" wp-config.php
printf '»»» creating db\n' &&
wp db create &&
printf '»»» importing db\n' &&
wp db import"

printf "\n${BRN}========== IMPORTING WP DB FINISHED ==========${NC}\n"
