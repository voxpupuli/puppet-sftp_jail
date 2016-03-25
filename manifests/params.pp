# == Class sftp_jail::params
#
# This class is meant to be called from sftp_jail.
# It sets variables according to platform.
#
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
