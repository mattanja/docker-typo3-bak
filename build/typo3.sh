#!/bin/bash

cd /var/www/html/
git clone --depth=1 https://git.typo3.org/Packages/TYPO3.CMS.git -b TYPO3_8-7
ln -s TYPO3.CMS typo3_src
ln -s typo3_src/index.php
ln -s typo3_src/typo3
cp typo3_src/_.htaccess .htaccess

cd /var/www/html/TYPO3.CMS/
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php composer.phar install --no-dev
