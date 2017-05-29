#!/bin/sh

set -eux

apk add sudo
adduser admin wheel

echo "admin ALL=(ALL) ALL" >> /etc/sudoers
