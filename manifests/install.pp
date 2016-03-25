# == Class sftp_jail::install
#
# This class is called from sftp_jail for install.
#
class sftp_jail::install {

  package { $::sftp_jail::package_name:
    ensure => present,
  }
}
