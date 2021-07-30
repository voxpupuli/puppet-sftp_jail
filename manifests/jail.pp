# @summary One SFTP Jail where users get "chrooted" into
#
# A jail can have one or multiple users. With multiple users, they can share
# some date via the `/incomming` directory.
#
# @example Single user
#   # The `sftp_jail::jail` resource creates a jail with a single home directory
#   # and an `incoming` directory. `incoming` is owned by the user and group
#   # provided when declaring the resource:
#   sftp_jail::jail { 'myjail':
#     user  => 'bbriggs',
#     group => 'bbriggs',
#   }
#
# @example Shared jail
#   # Sometimes, more than one user will need to access the same jail, but with
#   # different permissions. For instance, one may need read-write access while
#   # another is limited to read-only. In such a case, first create the jail with
#   # your write user and set up a match_group that redirects users. Again, the
#   # users and groups must already exist.
#   sftp_jail::jail { 'shared_jail':
#     user        => 'writeuser',
#     group       => 'writegroup',
#     match_group => 'sftpusers',
#   }
#   # Now add a user to your jail.
#   sftp_jail::user { 'readuser':
#     jail => '/chroot/shared_jail',
#   }
#   # To share write access to `/incoming`, set the `group` parameter of
#   # `sftp_jail::jail` to a group that is common to both users, such as the
#   # `sftpusers` group that you might use to redirect users into a jail.
#
# @param jail_name
#   The jails name.
#
# @param user
#   The user that will own the corresponding home directory in the jail, giving
#   the user a place to land. Also sets user ownership for `/incoming`.
#
# @param group
#   The group that will own the corresponding home directory in the jail,
#   giving the user a place to land. Also sets group ownership for `/incoming`.
#
# @param match_group
#   Set the group that SSHd will look for when redirecting users to the jail.
#   Useful for shared jails. Defaults to the value of `group`.
#
# @param password_authentication
#   Can the user login with a password? Public key authentication is generally
#   recommended and has to be configured outside of the scope of this module.
#
define sftp_jail::jail (
  Sftp_jail::File_name $jail_name            = $name,
  Sftp_jail::User_name $user                 = $name,
  Sftp_jail::User_name $group                = $user,
  Sftp_jail::User_name $match_group          = $group,
  Enum['yes', 'no'] $password_authentication = $sftp_jail::password_authentication,
) {
  include sftp_jail
  $jail_base = "${sftp_jail::chroot_base}/${jail_name}"

  file { [$jail_base, "${jail_base}/home"]:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { "${jail_base}/incoming":
    ensure => 'directory',
    owner  => $user,
    group  => $group,
    mode   => '0775',
  }

  file { "${jail_base}/home/${user}":
    ensure => 'directory',
    owner  => $user,
    group  => $group,
    mode   => '0755',
  }

  ssh::server::match_block { $match_group:
    type    => 'Group',
    options => {
      'ChrootDirectory'        => $jail_base,
      'ForceCommand'           => 'internal-sftp',
      'PasswordAuthentication' => $password_authentication,
      'AllowTcpForwarding'     => 'no',
      'X11Forwarding'          => 'no',
    },
  }
}
