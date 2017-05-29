#!/bin/sh

set -exu

adduser -D admin
echo "admin:${ADMIN_PASSWORD:-nimda}" | chpasswd
mkdir -pm 700 /home/admin/.ssh
chown -R admin:admin /home/admin/.ssh
chmod -R go-rwsx /home/admin/.ssh

lbu add /home/admin
