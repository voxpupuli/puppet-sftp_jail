# @summary Manage SFTP Jails
#
# @param jails
#   Jails to create. See `sftp_jail::jail` for more details.
#
# @param users
#   Users to create. See `sftp_jail::user` for more details.
#
# @param chroot_base
#   All jails are located in this directory.
#
# @param sub_dirs
#   A list of default subdirectories to ensure in every SFTP users home. Having a 
#   default list of subdirectories is especially usefull, when a lot of users
#   need to have the exact same directory structure in there home. This list
#   can be overwritten or extended for each user seperatly.
#   see: `sftp_jail::merge_subdirs`
#
# @param merge_subdirs
#   Merge  each users list of subdirectories (`sftp_jail::user::sub_dirs`)
#   with the default list of subdirectories (`sftp_jail::sub_dirs`)?
#
# @param password_authentication
#   Default Password Authentication setting for SFTP jails. This will only
#   impact SFTP users which are put in a chroot jail by this module.
#
class sftp_jail (
  Hash[String[1],Hash] $jails                   = {},
  Hash[String[1],Hash] $users                   = {},
  Stdlib::Absolutepath $chroot_base             = '/chroot',
  Sftp_jail::Sub_dirs  $sub_dirs                = [],
  Boolean              $merge_subdirs           = false,
  Enum['yes', 'no']    $password_authentication = 'no',
) {
  file { $chroot_base:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  $jails.each |$jail, $properties| {
    sftp_jail::jail { $jail: * => $properties }
  }
  $users.each |$user, $properties| {
    sftp_jail::jail { $user: * => $properties }
  }
}
