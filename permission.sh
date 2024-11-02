#!/bin/bash
sudo chown -R waouzw:www-data /home/waouzw/php/magento2
sudo find /home/waouzw/php/magento2 -type f -exec chmod 664 {} \;
sudo find /home/waouzw/php/magento2 -type d -exec chmod 775 {} \;
sudo rm -rf /home/waouzw/php/magento2/generated/*
php bin/magento setup:di:compile
systemctl start mysql
php bin/magento cache:clean
php bin/magento cache:flush
php bin/magento indexer:reindex
