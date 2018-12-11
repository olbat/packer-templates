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
 `bintray_user`  | olbat         | [Bintray](https://bintray.com) username
 `bintray_api_key` | $BINTRAY_API_KEY | [Bintray](https://bintray.com) credentials

__Note__: there may be other user variables depending on the template

Example: `packer build --var headless=false template.json`


## Pre-built images
- [alpine-ssh-bastion](alpine-ssh-bastion.md#pre-built-images)
- [alpine-ssh-bastion_datamode](alpine-ssh-bastion_datamode.md#pre-built-images)

__Important__: in order to make this images testable, the default SSH credentials are [versioned](credentials/) in this repository.  
_Always_ rebuild the images with your SSH credentials (see [config/](config/)) before using them in a production environment.


## Credits
Thanks to [kaorimatz](https://github.com/kaorimatz/packer-templates) and
[maier](https://github.com/maier/packer-templates) for their awesome work that
made bootstraping this repository/templates a lot easier.
