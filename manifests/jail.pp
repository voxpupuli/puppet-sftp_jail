define sftp_jail::jail (
  $jail_name               = $name,
  $user                    = undef,
  $group                   = undef,
  $match_group             = undef,
  $password_authentication = 'no',
  ) {
  include sftp_jail
  $jail_base = "${sftp_jail::chroot_base}/${jail_name}"

  if ($match_group) {
    $ssh_match_group = $match_group
  }
  else {
    $ssh_match_group = $group
  }

  if !($group) {
    $group = $user
  }

  file { $jail_base:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File[$sftp_jail::chroot_base],
  }

  file { "${jail_base}/incoming":
    ensure  => 'directory',
    owner   => $user,
    group   => $group,
    mode    => '0775',
    require => File[$sftp_jail::chroot_base],
  }

  file { "${jail_base}/home":
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File[$sftp_jail::chroot_base],
  }

  file { "${jail_base}/home/${user}":
    ensure  => 'directory',
    owner   => $user,
    group   => $group,
    mode    => '0755',
    require => File["${jail_base}/home"],
  }

  ssh::server::match_block { $ssh_match_group:
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
