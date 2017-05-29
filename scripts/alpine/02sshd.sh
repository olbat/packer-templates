#!/bin/sh

set -eux

addgroup jump-only

rm /etc/ssh/ssh_host_*key*
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""
ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key -N ""

sed -i /etc/ssh/sshd_config -e "s/%SSHD_PORT%/$SSHD_PORT/"

rc-service sshd restart
