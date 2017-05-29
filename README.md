# packer-templates [![Build Status](https://secure.travis-ci.org/olbat/packer-templates.png?branch=master)](https://travis-ci.org/olbat/packer-templates)

A collection of [Packer](https://packer.io/) templates


## Usage
Build and push every images
```bash
$ make
```

Build and push a specific image
```bash
$ packer build template.json
```


## Pre-built images
- alpine-ssh-bastion ([atlas](https://atlas.hashicorp.com/olbat/artifacts/alpine-ssh-bastion))

__Important__: in order to make this images testable, the default SSH credentials are [versioned](identity) in this repository.  
_Always_ rebuild the images with your SSH credentials (see [config/](config/)) before using them in a production environment.


## Configuration
You can configure each template to match your requirements by setting the following [user variables](https://www.packer.io/docs/templates/user-variables.html).

 User Variable   | Default Value | Description
-----------------|---------------|-------------------------------------------
 `headless`      | true          | Build without running the hypervisor's GUI
 `disk_size`     | 10240         | Hard disk size (in MB)
 `memory`        | 512           | Memory size (in MB)
 `cpus`          | 1             | The number of CPU cores
 `image_name`    | n/a           | The name of the image that will be built/pushed
 `image_version` | n/a           | The version of the image that will be built/pushed
 `atlas_user`    | olbat         | [Atlas](https://atlas.hashicorp.com) username
 `atlas_token`   | $ATLAS_TOKEN  | [Atlas](https://atlas.hashicorp.com) credentials

__Note__: there may be other user variables depending on the template

__Example__:
```bash
packer build --var headless=false template.json
```


## Credits
Thanks to [kaorimatz](https://github.com/kaorimatz/packer-templates) and
[maier](https://github.com/maier/packer-templates) for their awesome work that
made bootstraping this repository/templates a lot easier.
