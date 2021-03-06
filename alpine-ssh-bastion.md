# Alpine Linux SSH bastion image

This image contains an [Alpine Linux](https://alpinelinux.org/) system ([sys](https://wiki.alpinelinux.org/wiki/Installation) mode) embeding an hardened SSH server configured to be used as a [bastion](https://en.wikipedia.org/wiki/Bastion_host)/[jump server](https://en.wikipedia.org/wiki/Jump_server).

## Content
### Services
In addition to an SSH server, this image also contains the following services:

- `iptables` (configured to avoid floods and only answer to connections on SSH port)
- `logrotate`
- (`fail2ban` can be enabled by adding the _02fail2ban.sh_ script to Packer's provider)

### Users
By default, there is only 2 users: an admin user that can open interactive sessions and install packages and a jump user that can only use the SSH service as a proxy (no interactive sessions allowed).


## Usage
### QEMU
```bash
$ qemu-system-x86_64 \
    -enable-kvm -smp cores=1 \
    -m 512 -balloon virtio \
    -device virtio-net,netdev=user0 -netdev user,id=user0 \
    -device virtio-scsi-pci,id=scsi0 -device scsi-hd,bus=scsi0.0,drive=drive0 \
    -drive if=none,id=drive0,file=alpine-ssh-bastion.qcow2
```

### VirtualBox
```bash
$ VBoxManage import alpine-ssh-bastion.ovf
$ VBoxManage startvm alpine-ssh-bastion
```


## Build configuration
You can configure each template to match your requirements by setting the following [user variables](https://www.packer.io/docs/templates/user-variables.html).

 User Variable    | Default Value | Description
------------------|---------------|-------------------------------------------
 `alpine_version` | 3.8.2         | The version of Alpine Linux
 `hostname`       | bastion       | The machine's hostname (see [setup-hostname](https://wiki.alpinelinux.org/wiki/Alpine_setup_scripts))
 `keymap`         | us us         | The machine's keyboard mapping (see [setup-keymap](https://wiki.alpinelinux.org/wiki/Alpine_setup_scripts))
 `timezone`       | UTC           | The machine's timezone (see [setup-timezone](https://wiki.alpinelinux.org/wiki/Alpine_setup_scripts))
 `name_servers`   | 1.1.1.1 8.8.8.8 | The machine's name servers (see [setup-dns](https://wiki.alpinelinux.org/wiki/Alpine_setup_scripts))
 `http_proxy`     | none          | The machine's HTTP proxy (see [setup-proxy](https://wiki.alpinelinux.org/wiki/Alpine_setup_scripts))
 `sshd_port`      | 1234          | The port the SSH server is listening to
 `jump_user`      | jump          | The user that has to be used to jump
 `root_password`  | `I'm too lazy to change the root password :(` | The default password for the `root` user
 `admin_password` | `I'm too lazy to change the admin password :(` | The default password for the `admin` user

__Note__: see the [README](README.md#configuration) file to get the generic config fields


## Pre-built images
- QEMU ([bintray](https://bintray.com/olbat/qemu/alpine-ssh-bastion))
- VirtualBox ([bintray](https://bintray.com/olbat/virtualbox/alpine-ssh-bastion))

__Important__: in order to make this images testable, the default SSH credentials are [versioned](credentials/) in this repository.  
_Always_ rebuild the images with your SSH credentials (see [config/](config/)) before using them in a production environment.
