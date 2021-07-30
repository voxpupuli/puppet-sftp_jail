# @summary A list of subdirectories
#
# @example A valid subdirectory
#   As!8df/[1qwEr/zXcv0'
type Sftp_jail::Sub_dirs = Array[Pattern[/\A([^\/\0]+\/*)*\z/]]
