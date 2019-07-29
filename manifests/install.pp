# private
class sftp_jail::install {
  package { $sftp_jail::package_name:
    ensure => present,
  }
}
