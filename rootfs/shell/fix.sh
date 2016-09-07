#!/bin/bash

# FIX EMAIL
line=$(head -n 1 /etc/hosts)
line2=$(echo $line | awk '{print $2}')
echo "$line $line2.localdomain" >> /etc/hosts
echo "-> Added hostname.localdomain added for Email"
# END FIX EMAIL

# CHOWN HTML FOLDER
chown -R :xfs /var/www/html
chmod -R 770 /var/www/html
echo "-> Owned /var/www/html folder with linux group 33 (debian www-data) and changed user rights"
# END CHOWN HTML FOLDER

while true
do
  # loop infinitely
  sleep 2
done
