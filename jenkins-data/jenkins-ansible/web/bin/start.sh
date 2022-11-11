#!/bin/bash

#Starts SSH

/usr/sbin/sshd

#Starts php process in background

/usr/sbin/php-fpm -c /etc/php/fpm

#Starts nginx demon

nginx -g 'daemon off;'

