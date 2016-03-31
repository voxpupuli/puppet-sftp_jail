# Class: sftp_jail::user
# ==============================
#
# Adds a user's home dir to an SFTP jail
# Used for shared jails to allow multiple users to write
# Or to allow one user to write and others to read-only
#
# Parameters
# ----------
#
# * `user`
#   User name that should access/own the directory.
#   Defaults to name of resource.
#
# * `group`
#   Group name that should own the directory.
#   Defaults to name of resource.
#
# * `jail`
#   Path to the jail that the user's directory should be set to.
#   Be careful not to add a trailing slash.
#   e.g. `/chroot/myjail`
#
# Examples
# -------
# sftp_jail::user {'bob':
#   jail => '/chroot/myjail',
# }
#
# sftp_jail::user{'bob':
#   group => 'myjail_write',
#   jail  => '/chroot/myjail',
# }
define sftp_jail::user (
  $user  = $name,
  $group = $name,
  $jail =  undef,
  ) {
  file { "${jail}/home/${user}":
    ensure  => 'directory',
    owner   => $user,
    group   => $group,
    mode    => '0755',
    require => File["${jail}/home"],
  }
}
