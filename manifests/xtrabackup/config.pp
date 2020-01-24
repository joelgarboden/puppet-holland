# @summary Manage the Holland xtrabackup provider configuration.
#
# @api private
#
class holland::xtrabackup::config (
  Enum['absent', 'present']                    $ensure                = $::holland::xtrabackup::ensure,
  String                                       $additional_options    = $::holland::xtrabackup::additional_options,
  Optional[String]                             $after_backup_command  = $::holland::xtrabackup::after_backup_command,
  Enum['no', 'yes']                            $bin_log_position      = $::holland::xtrabackup::bin_log_position,
  Optional[String]                             $before_backup_command = $::holland::xtrabackup::before_backup_command,
  Optional[Stdlib::Absolutepath]               $compress_bin_path     = $::holland::xtrabackup::compress_bin_path,
  Enum['no', 'yes']                            $compress_inline       = $::holland::xtrabackup::compress_inline,
  Integer[0, 9]                                $compress_level        = $::holland::xtrabackup::compress_level,
  Enum['gzip', 'pigz', 'bzip', 'lzop', 'lzma'] $compress_method       = $::holland::xtrabackup::compress_method,
  Optional[String]                             $databases             = $::holland::xtrabackup::databases,
  String                                       $defaults_extra_file   = $::holland::xtrabackup::defaults_extra_file,
  Enum['no', 'yes']                            $dump_events           = $::holland::xtrabackup::dump_events,
  Enum['no', 'yes']                            $dump_routines         = $::holland::xtrabackup::dump_routines,
  Optional[String]                             $exclude_databases     = $::holland::xtrabackup::exclude_databases,
  Optional[String]                             $exclude_tables        = $::holland::xtrabackup::exclude_tables,
  Optional[String]                             $failed_backup_command = $::holland::xtrabackup::failed_backup_command,
  Enum['no', 'yes']                            $file_per_database     = $::holland::xtrabackup::file_per_database,
  Enum['no', 'yes']                            $flush_logs            = $::holland::xtrabackup::flush_logs,
  Enum[
    'flush-lock',
    'lock-tables',
    'single-transaction',
    'auto-detect',
    'none'
  ]                                            $lock_method           = $::holland::xtrabackup::lock_method,
  Optional[Stdlib::Absolutepath]               $mysql_binpath         = $::holland::xtrabackup::mysql_binpath,
  Optional[String]                             $mysql_host            = $::holland::xtrabackup::mysql_host,
  Optional[String]                             $mysql_password        = $::holland::xtrabackup::mysql_password,
  Optional[Integer]                            $mysql_port            = $::holland::xtrabackup::mysql_port,
  Optional[Stdlib::Absolutepath]               $mysql_socket          = $::holland::xtrabackup::mysql_socket,
  Optional[String]                             $mysql_user            = $::holland::xtrabackup::mysql_user,
  Enum['no', 'yes']                            $stop_slave            = $::holland::xtrabackup::stop_slave,
  Optional[String]                             $tables                = $::holland::xtrabackup::tables,
) {

  $file_ensure = $ensure ? {
    'present' => file,
    default   => $ensure,
  }

  # Configure the global xtrabackup provider configuration.
  file { '/etc/holland/providers/xtrabackup.conf':
    ensure  => $file_ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('holland/providers/xtrabackup.conf.erb'),
  }
}
