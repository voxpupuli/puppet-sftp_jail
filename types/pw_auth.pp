# @summary Password Authentication setting for SFTP users and Admins.
#
# @param sftp_admins
#   Password Authentication setting SFTP admins.
#
# @param sftp_userss
#   Password Authentication setting SFTP users.
#
type Sftp_jail::Pw_auth = Struct[{
  Optional[sftp_admins] => Boolean,
  Optional[sftp_users]  => Boolean,
}]
