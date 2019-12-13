# private
class sftp_jail::params {
  case $facts['os']['family'] {
    'Debian': {
      $package_name = 'sftp_jail'
      $service_name = 'sftp_jail'
    }
    'RedHat', 'Amazon': {
      $package_name = 'sftp_jail'
      $service_name = 'sftp_jail'
    }
    default: {
      fail("${facts['os']['name']} not supported")
    }
  }
}
