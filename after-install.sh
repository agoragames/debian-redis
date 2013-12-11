#!/bin/bash

mkdir -p /var/lib/redis/
mkdir -p /etc/redis
addgroup --system redis
adduser --system --disabled-password --no-create-home --disabled-login redis
adduser redis redis
chown -R redis:redis /var/lib/redis
chown -R redis:redis /etc/redis
