# private
class sftp_jail::service {
  service { $sftp_jail::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
