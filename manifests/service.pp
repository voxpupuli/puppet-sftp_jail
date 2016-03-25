# == Class sftp_jail::service
#
# This class is meant to be called from sftp_jail.
# It ensure the service is running.
#
class sftp_jail::service {

  service { $::sftp_jail::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
