define sftp_jail::jail (
  $jail_name               = $name,
  $write_user              = undef,
  $jail_group              = undef,
  $password_authentication = 'no',
  ) {
  include ::sftp_jail
  $jail_base = "${::sftp_jail::chroot_base}/${jail_name}"
  file { $jail_base:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File[$::sftp_jail::chroot_base],
  }

  file { "${jail_base}/incoming":
    ensure  => 'directory',
    owner   => $write_user,
    group   => $jail_group,
    mode    => '0755',
    require => File[$::sftp_jail::chroot_base],
  }

  file { "${jail_base}/home":
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File[$::sftp_jail::chroot_base],
  }

  file { "${jail_base}/home/${write_user}":
    ensure  => 'directory',
    owner   => $write_user,
    group   => $jail_group,
    mode    => '0755',
    require => File["${jail_base}/home"],
  }

  ssh::server::match_block { $jail_group:
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
