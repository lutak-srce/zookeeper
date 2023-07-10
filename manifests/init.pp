#
# = Class: zookeeper
#
class zookeeper (
  $package_ensure      = present,
  $package_manage      = true,
  $package_name        = $::zookeeper::params::package_name,
  $service_enable      = true,
  $service_ensure      = 'running',
  $service_manage      = true,
  $service_name        = $::zookeeper::params::service_name,
  $service_provider    = undef,
  $service_hasstatus   = true,
  $service_hasrestart  = true,
  $confdir             = $::zookeeper::params::confdir,
  $alternatives_manage = $::zookeeper::params::alternatives_manage,
  $confdir_altname     = $::zookeeper::params::confdir_altname,
  $confdir_altlink     = $::zookeeper::params::confdir_altlink,
  $datadir             = $::zookeeper::params::datadir,
  $datadir_mode        = $::zookeeper::params::datadir_mode,
  $datalogdir          = undef,
  $tick_time           = 2000,
  $init_limit          = 10,
  $sync_limit          = 5,
  $pre_alloc_size      = undef,
  $snap_count          = undef,
  $snap_retain_count   = undef,
  $purge_interval      = undef,
  $max_client_cnxns    = undef,
  $max_session_timeout = undef,
  $leader_serves       = undef,
  $java_opts           = undef,
  $zoocfg_template     = $::zookeeper::params::zoocfg_template,
  $zkenv_template      = $::zookeeper::params::zkenv_template,
  $zkenv_path          = $::zookeeper::params::zkenv_path,
  $log4j_source        = 'puppet:///modules/zookeeper/log4j.properties',
  $logbk_source        = undef,
  $template_myid       = 'zookeeper/myid.erb',
  $myid                = undef,
  $nodes               = [],
) inherits zookeeper::params {

  ### Input parameters validation
  validate_string($package_ensure)
  validate_bool($package_manage)
  validate_array($package_name)
  validate_bool($service_enable)
  validate_re($service_ensure, ['running','stopped',undef], 'Valid values are: running, stopped')
  validate_bool($service_manage)
  validate_string($service_name)
  validate_string($service_provider)
  validate_bool($service_hasstatus)
  validate_bool($service_hasrestart)
  validate_absolute_path($confdir)
  validate_bool($alternatives_manage)
  if ( $alternatives_manage ) {
    validate_string($confdir_altname)
    validate_absolute_path($confdir_altlink)
  }

  validate_numeric($tick_time)
  validate_numeric($init_limit)
  validate_numeric($sync_limit)

  ### Install and deploy
  include zookeeper::install
  include zookeeper::config
  include zookeeper::service

  Class['::zookeeper::install']
  -> Class['::zookeeper::config']
  ~> Class['::zookeeper::service']

}
