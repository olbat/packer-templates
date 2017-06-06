# Alpine Linux SSH bastion image

This image contains an [Alpine Linux](https://alpinelinux.org/) system ([data](https://wiki.alpinelinux.org/wiki/Installation) mode) embeding an hardened SSH server configured to be used as a [bastion](https://en.wikipedia.org/wiki/Bastion_host)/[jump server](https://en.wikipedia.org/wiki/Jump_server).

## Content
### Services
In addition to an SSH server, this image also contains the following services:

- `iptables` (configured to avoid floods and only answer to connections on SSH port)
- `logrotate`
- (`fail2ban` can be enabled by adding the _02fail2ban.sh_ script to Packer's provider)

### Users
By default, there is only 2 users: an admin user that can open interactive sessions and install packages and a jump user that can only use the SSH service as a proxy (no interactive sessions allowed).

### LBU
The images are configured using [LBU](https://wiki.alpinelinux.org/wiki/Alpine_local_backup) so you have to boot them using the installation CDROM (cf. `grep iso_urls alpine-ssh-bastion.json`) and be sure you save your configuration using `lbu commit` before restarting.

__Note__: for the `QEMU` image you'll have to precise the `-boot d` option to be sure the VM boots from the CDROM.


## Build configuration
You can configure each template to match your requirements by setting the following [user variables](https://www.packer.io/docs/templates/user-variables.html).

 User Variable    | Default Value | Description
------------------|---------------|-------------------------------------------
 `alpine_version` | 3.6           | The version of Alpine Linux
 `sshd_port`      | 1234          | The port the SSH server is listening to
 `jump_user`      | jump          | The user that has to be used to jump
 `root_password`  | `I'm too lazy to change the root password :(` | The default password for the `root` user
 `admin_password` | `I'm too lazy to change the admin password :(` | The default password for the `admin` user

__Note__: see the [README](README.md#configuration) file to get the generic config fields


## Pre-built images
- QEMU ([atlas](https://atlas.hashicorp.com/olbat/artifacts/alpine-ssh-bastion_datamode/types/qemu.image), [bintray](https://bintray.com/olbat/qemu/alpine-ssh-bastion_datamode))
- VirtualBox ([atlas](https://atlas.hashicorp.com/olbat/artifacts/alpine-ssh-bastion_datamode/types/virtualbox.image), [bintray](https://bintray.com/olbat/virtualbox/alpine-ssh-bastion_datamode))

__Important__: in order to make this images testable, the default SSH credentials are [versioned](credentials/) in this repository.  
_Always_ rebuild the images with your SSH credentials (see [config/](config/)) before using them in a production environment.
