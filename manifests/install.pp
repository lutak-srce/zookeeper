# @summary
#   This class handles zookeeper packages.
#
# @api private
#
class zookeeper::install inherits zookeeper {

  if $zookeeper::package_manage {

    package { $zookeeper::package_name:
      ensure => $zookeeper::package_ensure,
    }

  }

  file { 'zookeeper_data_dir' :
    ensure => directory,
    owner  => 'zookeeper',
    group  => 'zookeeper',
    mode   => $zookeeper::datadir_mode,
    path   => $zookeeper::datadir,
  }

  file { 'zookeeper_data_dir_data' :
    ensure => directory,
    owner  => 'zookeeper',
    group  => 'zookeeper',
    mode   => '0750',
    path   => "${zookeeper::datadir}/data",
  }

  if ( $zookeeper::datalogdir ) {
    file { 'zookeeper_data_log_dir' :
      ensure => directory,
      owner  => 'zookeeper',
      group  => 'zookeeper',
      mode   => '0750',
      path   => $zookeeper::datalogdir,
    }
  }

}
