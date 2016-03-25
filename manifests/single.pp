define sftp_jail::single (
  $jail_name               = $name,
  $jail_user               = undef,
  $jail_group              = undef,
  $password_authentication = 'no',
  ) {
  include ::sftp_jail

  $jail_base = "${::sftp_jail::chroot_base}/${jail_name}"
  file {$jail_base:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File[$::sftp_jail::chroot_base],
  }

  file {"${jail_base}/incoming":
    ensure  => 'directory',
    owner   => $jail_user,
    group   => $jail_group,
    mode    => '0775',
    require => File[$::sftp_jail::chroot_base],
  }

  file {"${jail_base}/home":
    ensure  => 'directory',
    owner   => $jail_user,
    group   => $jail_group,
    mode    => '0775',
    require => File[$::sftp_jail::chroot_base],
  }

  file {"${jail_base}/home/${jail_user}":
    ensure  => 'directory',
    owner   => $jail_user,
    group   => $jail_group,
    mode    => '0775',
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
    }
  }
}
