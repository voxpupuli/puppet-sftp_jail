# sftp_jail

[![CI](https://github.com/voxpupuli/puppet-sftp_jail/actions/workflows/ci.yml/badge.svg)](https://github.com/voxpupuli/puppet-sftp_jail/actions/workflows/ci.yml)
[![Code Coverage](https://coveralls.io/repos/github/voxpupuli/puppet-sftp_jail/badge.svg?branch=master)](https://coveralls.io/github/voxpupuli/puppet-sftp_jail)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/sftp_jail.svg)](https://forge.puppetlabs.com/puppet/sftp_jail)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/sftp_jail.svg)](https://forge.puppetlabs.com/puppet/sftp_jail)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/sftp_jail.svg)](https://forge.puppetlabs.com/puppet/sftp_jail)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/sftp_jail.svg)](https://forge.puppetlabs.com/puppet/sftp_jail)

## Overview

This module leverages saz-ssh to more easily create a more robust-ier SFTP jail. Because of how SSH key pairs work in Linux, this module creates a home dir for each jail user, so that keys can be added to `authorized_keys` and a homedir assigned without the nasty problem of the user escaping from the jail and landing in `/` because of a mistaken homedir assignment.

## Usage

Create `sftp_jail::jail` resources to create jails. Each jail has one main user. If you need more then one user in a jail, create `sftp_jail::user` resources for additional users and pass the correct `jail` to it.

## Changelog

see [CHANGELOG.md](CHANGELOG.md)

## References

see [REFERENCE.md](REFERENCE.md)
