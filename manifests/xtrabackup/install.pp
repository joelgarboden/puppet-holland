# @summary Manage the `holland-xtrabackup` package
#
# @api private
#
class holland::xtrabackup::install (
  Enum['absent', 'present'] $ensure = $::holland::xtrabackup::ensure,
){
  # https://github.com/holland-backup/holland/issues/247
  # Debian/Ubuntu have plugin bundled
  if $facts['os']['name'] in [ 'CentOS', 'RedHat', 'Scientific' ] {
    # Install the xtrabackup provider
    package { 'holland-xtrabackup':
      ensure => $ensure,
    }
  }
}
