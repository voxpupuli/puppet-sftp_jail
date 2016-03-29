# local_user

[![Build Status](https://travis-ci.org/bbriggs/puppet-sftp_jail.png?branch=master)](https://travis-ci.org/bbriggs/puppet-sftp_jail)

#### Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options and additional functionality](#usage)
    * [Resource Definition](#resource-definition)

## Overview

This module leverages saz-ssh to more easily create a robust-ier SFTP jail. 
Because of how SSH key pairs work in Linux, this module creates a home dir for each jail user, so that keys can be added to `authorized_keys` and a homedir assigned without the nasty problem of the user escaping from the jail and landing in `/` because of a mistaken homedir assignment. 

## Usage

### Resource Definition

Create a single-user jail by first defining your user and group, then declaring the jail:

```puppet
    sftp_jail::single { 'myjail':
      jail_user  => 'bbriggs',
      jail_group => 'bbriggs',
    }
```
