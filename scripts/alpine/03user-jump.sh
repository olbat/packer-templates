#!/bin/sh

set -exu

JUMP_USER=${JUMP_USER:-jump}

addgroup $JUMP_USER
adduser -S -D -h /var/lib/$JUMP_USER -s /bin/false -G $JUMP_USER $JUMP_USER
adduser $JUMP_USER jump-only
mkdir -pm 700 /var/lib/$JUMP_USER/.ssh
chown -R $JUMP_USER:$JUMP_USER /var/lib/$JUMP_USER/.ssh
chmod -R go-rwsx /var/lib/$JUMP_USER/.ssh
