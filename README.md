# sftp_jail

[![Build Status](https://travis-ci.org/voxpupuli/puppet-sftp_jail.png?branch=master)](https://travis-ci.org/voxpupuli/puppet-sftp_jail)

## Overview
This module leverages saz-ssh to more easily create a more robust-ier SFTP jail. Because of how SSH key pairs work in Linux, this module creates a home dir for each jail user, so that keys can be added to `authorized_keys` and a homedir assigned without the nasty problem of the user escaping from the jail and landing in `/` because of a mistaken homedir assignment.

## Usage
Create `sftp_jail::jail` resources to create jails. Each jail has one main user. If you need more then one user in a jail, create `sftp_jail::user` resources for additional users and pass the correct `jail` to it.