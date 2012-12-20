module Test_holland =

  let conf = "
## Root holland config file
[holland]

## Paths where holland plugins may be found.
## Can be comma separated
plugin_dirs = /usr/share/holland/plugins

## Top level directory where backups are held
backup_directory = /var/spool/holland

## List of enabled backup sets. Can be comma separated.
## Read from <config_dir>/backupsets/<name>.conf
# backupsets = example, traditional, parallel_backups, non_transactional
backupsets = default, local

# Define a umask for file generated by holland
umask = 0007

# Define a path for holland and its spawned processes
path = /usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

[logging]
## where to write the log
filename = /var/log/holland/holland.log

## debug, info, warning, error, critical (case insensitive)
level = info
"

  test Holland.lns get conf =
    {  }
    { "#comment" = "# Root holland config file" }
    { "holland"
      {  }
      { "#comment" = "# Paths where holland plugins may be found." }
      { "#comment" = "# Can be comma separated" }
      { "plugin_dirs"
        { "path" = "/usr/share/holland/plugins" }
      }
      {  }
      { "#comment" = "# Top level directory where backups are held" }
      { "backup_directory" = "/var/spool/holland" }
      {  }
      { "#comment" = "# List of enabled backup sets. Can be comma separated." }
      { "#comment" = "# Read from <config_dir>/backupsets/<name>.conf" }
      { "#comment" = "backupsets = example, traditional, parallel_backups, non_transactional" }
      { "backupsets"
        { "set" = "default" }
        { "set" = "local" }
      }
      {  }
      { "#comment" = "Define a umask for file generated by holland" }
      { "umask" = "0007" }
      {  }
      { "#comment" = "Define a path for holland and its spawned processes" }
      { "path" = "/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin" }
      {  }
    }
    { "logging"
      { "#comment" = "# where to write the log" }
      { "filename" = "/var/log/holland/holland.log" }
      {  }
      { "#comment" = "# debug, info, warning, error, critical (case insensitive)" }
      { "level" = "info" }
    }
