# sftp_jail

[![Build Status](https://travis-ci.org/voxpupuli/puppet-sftp_jail.png?branch=master)](https://travis-ci.org/voxpupuli/puppet-sftp_jail)

#### Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options and additional functionality](#usage)
    * [Examples](#examples)
      * [Single user](#single-user)
      * [Shared jail](#shared-jail)
3. [Parameters](#parameters)
    * [Jail](#jail)
    * [User](#user)

This module leverages saz-ssh to more easily create a more robust-ier SFTP jail. Because of how SSH key pairs work in Linux, this module creates a home dir for each jail user, so that keys can be added to `authorized_keys` and a homedir assigned without the nasty problem of the user escaping from the jail and landing in `/` because of a mistaken homedir assignment.

## Usage

### Examples

#### Single user

The `sftp_jail::jail` resource creates a jail with a single home directory and an `incoming` directory. `incoming` is owned by the user and group provided when declaring the resource:


```puppet
    sftp_jail::jail { 'myjail':
      user  => 'bbriggs',
      group => 'bbriggs',
    }
```

#### Shared jail

Sometimes, more than one user will need to access the same jail, but with different permissions. For instance, one may need read-write access while another is limited to read-only. In such a case, first create the jail with your write user and set up a match_group that redirects users. Again, the users and groups must already exist.

```puppet
    sftp_jail::jail { 'shared_jail':
      user        => 'writeuser',
      group       => 'writegroup',
      match_group => 'sftpusers',
    }
```
Now add a user to your jail.

```puppet
    sftp_jail::user { 'readuser':
      jail => '/chroot/shared_jail',
    }
```

To share write access to `/incoming`, set the `group` parameter of `sftp_jail::jail` to a group that is common to both users, such as the `sftpusers` group that you might use to redirect users into a jail.

## Parameters

### Jail

#### user

The user that will own the corresponding home directory in the jail, giving the user a place to land. Also sets user ownership for `/incoming`.

#### group

The group that will own the corresponding home directory in the jail, giving the user a place to land. Also sets group ownership for `/incoming`.

#### match_group

Set the group that SSHd will look for when redirecting users to the jail. Useful for shared jails. Defaults to the value of `group`.

### User

#### user

The username that will own the corresponding home directory in the jail, giving the user a place to land. Defaults to resource title.

#### group

The group that will own the corresponding home directory in the jail, giving the user a place to land. Defaults to resource title.

#### jail

The path of the jail's base directory, such as `/chroot/myjail`. Do not include a trailing slash.
