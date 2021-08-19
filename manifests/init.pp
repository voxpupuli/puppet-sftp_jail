# @summary Manage SFTP Jails
#
# @param chroot_base
#   All jails are located in this directory.
#
# @param password_authentication
#   Default Password Authentication setting for SFTP jails. This will only
#   impact SFTP users which are put in a chroot jail by this module.
#
class sftp_jail (
  Stdlib::Absolutepath $chroot_base             = '/chroot',
  Enum['yes', 'no']    $password_authentication = 'no',
) {
  file { $chroot_base:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
}
