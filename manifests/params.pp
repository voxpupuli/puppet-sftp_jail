# private
class sftp_jail::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'sftp_jail'
      $service_name = 'sftp_jail'
    }
    'RedHat', 'Amazon': {
      $package_name = 'sftp_jail'
      $service_name = 'sftp_jail'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
