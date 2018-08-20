#!/bin/sh

cd /etc/unbound
cat blocking.conf.head > blocking.conf
/usr/bin/python3 gen_adblocker.py >> blocking.conf
/etc/init.d/unbound restart

