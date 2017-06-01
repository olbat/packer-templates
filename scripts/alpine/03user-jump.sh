#!/bin/sh

set -exu

JUMP_USER=${JUMP_USER:-jump}

adduser -D -H -h /home/$JUMP_USER $JUMP_USER
adduser $JUMP_USER jump-only
echo "$JUMP_USER:$JUMP_USER" | chpasswd

mkdir -p ~$JUMP_USER/.ssh
chmod 700 ~$JUMP_USER/.ssh

chown -R $JUMP_USER:$JUMP_USER ~$JUMP_USER

lbu add ~$JUMP_USER
