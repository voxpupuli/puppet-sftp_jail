# Class: sftp_jail
# ===========================
#
# Full description of class sftp_jail here.
#
# Parameters
# ----------
#
# * `chroot_base: 
#   Absolute path for chroot.By default, it uses /chroot. To set another, just write in hiera: sftp_jail::chroot_base: '/var/anotherchroot'
#   Don't type the back stash
#
class sftp_jail (
  Stdlib::Absolutepath $chroot_base = '/chroot',
) inherits ::sftp_jail::params {

  exec { "Create ${chroot_base}":
    creates => $chroot_base,
    command => "/bin/mkdir -p ${chroot_base}",
  } -> file { $chroot_base: #}
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
}
