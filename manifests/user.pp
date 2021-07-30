# @summary Adds a user's home directory to an SFTP jail.
#
# Used for shared jails to allow multiple users to write, or to allow one user
# to write and others to read-only.
#
# @example Add user to the jail `myjail`
#   sftp_jail::user {'bob':
#     jail => '/chroot/myjail',
#   }
#
# @example Add user to the jail `myjail` and assign permissions
#   sftp_jail::user{'bob':
#     group => 'myjail_write',
#     jail  => '/chroot/myjail',
#   }
#
# @param jail
#   The path of the jail's base directory, such as `/chroot/myjail`. Do not
#   include a trailing slash.
#
# @param user
#   The username that will own the corresponding home directory in the jail,
#   giving the user a place to land.
#
# @param group
#   The group that will own the corresponding home directory in the jail.
#
# @param sub_dirs
#   This directory structure is enforced in the users Home.
#
# @param merge_subdirs
#   Merge sub_dirs with the default sub_dirs?
#
define sftp_jail::user (
  Stdlib::Absolutepath $jail,
  Sftp_jail::User_name $user          = $name,
  Sftp_jail::User_name $group         = $user,
  Sftp_jail::Sub_dirs  $sub_dirs      = $sftp_jail::sub_dirs,
  Boolean              $merge_subdirs = $sftp_jail::merge_subdirs,
) {
  $home = "${jail}/home/${user}"

  $merged_sub_dirs = $merge_subdirs ? {
    true    => unique($sftp_jail::sub_dirs + $sub_dirs),
    default => $sub_dirs,
  }
  $directories = [$home] + $merged_sub_dirs.map |$v| {
    "${home}/${v}"
  }

  file { $directories:
    ensure => 'directory',
    owner  => $user,
    group  => $group,
    mode   => '0755',
  }
}
