[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)

Ubuntu "Ansible Ready" Packaged by Bmeme
=========

Ubuntu "Ansible Ready" images based on [official Ubuntu repository](https://hub.docker.com/_/ubuntu), currently used by Bmeme for its 
`molecule` tests during Ansible Role development.

This project is basically a *fork* of [Geerlingguy](https://github.com/geerlingguy) `docker-ubuntuXX-ansible` projects modified at our needs

## What is contained in the images
* ansible, of course
* apt-utils
* build-essential
* software-properties-common
* locales
* python3-dev
* python3-setuptools
* python3-pip
* python3-yaml
* rsyslog 
* systemd
* systemd-cron
* sudo

## Supported tags and respective `Dockerfile` links
- `jammy-20221003`, `jammy`, `22.04`, `latest` [Dockerfile](https://github.com/bmeme/docker-ansible-ubuntu/blob/main/22.04/Dockerfile)
- `focal-20220922`, `focal`, `20.04` [Dockerfile](https://github.com/bmeme/docker-ansible-ubuntu/blob/main/20.04/Dockerfile)

## Credits
This project is a contribution of [Bmeme :: The Digital Factory](http://www.bmeme.com).
This library is actually maintained by [Daniele Piaggesi](https://github.com/g0blin79), 
[Roberto Mariani](https://github.com/jean-louis) and [Michele Mondelli](https://github.com/Mithenks).
Any other contribution will be really appreciated.