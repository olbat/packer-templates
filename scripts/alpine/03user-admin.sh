#!/bin/sh

set -exu

adduser -D -H -h /home/admin admin
echo "admin:${ADMIN_PASSWORD:-nimda}" | chpasswd

mkdir -p ~admin/.ssh
chmod 700 ~admin/.ssh
chmod -R go-rwsx ~admin/.ssh

chown -R admin:admin ~admin

lbu add ~admin
