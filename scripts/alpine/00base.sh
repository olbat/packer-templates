#!/bin/sh

set -eux

date > /.build_date

apk upgrade -U --available

echo "Alpine Linux based secure SSH bastion" > /etc/motd
