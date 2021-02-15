# Class: sftp_jail
# ===========================
#
# Full description of class sftp_jail here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class sftp_jail (
  Stdlib::Absolutepath $chroot_base = '/chroot',
) {
  file { $chroot_base:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
}
