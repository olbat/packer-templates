#!/bin/sh

set -eux

apk add fail2ban
rc-update add fail2ban
