#
# = Class: zookeeper
#
class zookeeper (
  $package_ensure           = present,
  $package_manage           = true,
  $package_name             = $::zookeeper::params::package_name,
  $service_enable           = true,
  $service_ensure           = 'running',
  $service_manage           = true,
  $service_name             = $::zookeeper::params::service_name,
  $service_provider         = undef,
  $service_hasstatus        = true,
  $service_hasrestart       = true,
  $confdir                  = $::zookeeper::params::confdir,
  $alternatives_manage      = $::zookeeper::params::alternatives_manage,
  $confdir_altname          = $::zookeeper::params::confdir_altname,
  $confdir_altlink          = $::zookeeper::params::confdir_altlink,
  $datadir                  = $::zookeeper::params::datadir,
  $datadir_mode             = $::zookeeper::params::datadir_mode,
  $datalogdir               = undef,
  $tick_time                = 2000,
  $init_limit               = 10,
  $sync_limit               = 5,
  $pre_alloc_size           = undef,
  $snap_count               = undef,
  $snap_retain_count        = undef,
  $purge_interval           = undef,
  $max_client_cnxns         = undef,
  $global_outstanding_limit = undef,
  $max_session_timeout      = undef,
  $admin_enable_server      = undef,
  $leader_serves            = undef,
  $java_opts                = undef,
  $zoocfg_template          = $::zookeeper::params::zoocfg_template,
  $zkenv_template           = $::zookeeper::params::zkenv_template,
  $zkenv_path               = $::zookeeper::params::zkenv_path,
  $log4j_source             = 'puppet:///modules/zookeeper/log4j.properties',
  $logbk_source             = undef,
  $template_myid            = 'zookeeper/myid.erb',
  $myid                     = undef,
  $nodes                    = [],
) inherits zookeeper::params {

  ### Install and deploy
  include zookeeper::install
  include zookeeper::config
  include zookeeper::service

  Class['::zookeeper::install']
  -> Class['::zookeeper::config']
  ~> Class['::zookeeper::service']

}
