# @summary
#   This class handles the configuration file.
#
# @api private
#
class zookeeper::config inherits zookeeper {

  file { 'zookeeper_conf_dir' :
    ensure => directory,
    path   => $zookeeper::confdir,
  }

  # if we manage alternatives, then set up symlink
  if ( $zookeeper::alternatives_manage ) {
    alternative_entry { $zookeeper::confdir :
      altname  => $zookeeper::confdir_altname,
      altlink  => $zookeeper::confdir_altlink,
      priority => '15',
    }

    alternatives { $zookeeper::confdir_altname :
      path    => $zookeeper::confdir,
      require => Alternative_entry[$zookeeper::confdir],
    }
  }

  # configuration files
  file { '/etc/zookeeper/zoo.cfg':
    path    => "${zookeeper::confdir}/zoo.cfg",
    content => template($zookeeper::zoocfg_template),
  }

  file { '/etc/zookeeper/zkEnv.sh':
    path    => $zookeeper::zkenv_path,
    content => template($zookeeper::zkenv_template),
  }

  file { '/etc/zookeeper/log4j.properties':
    path   => "${zookeeper::confdir}/log4j.properties",
    source => $zookeeper::log4j_source,
  }

  # myid
  file { '/etc/zookeeper/myid':
    path    => "${zookeeper::confdir}/myid",
    content => template($zookeeper::template_myid),
  }
  file { '/var/lib/zookeeper/myid':
    ensure => symlink,
    path   => "${zookeeper::datadir}/myid",
    target => "${zookeeper::confdir}/myid",
  }

}
