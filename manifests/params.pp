# @summary
#   This class provides default values for params.
#
# @api private
#
class zookeeper::params {

  # install package depending on major version
  case $facts['os']['family'] {
    default: {
    }
    /(RedHat|redhat|amazon)/: {
      $package_name         = [ 'zookeeper' ]
      $service_name         = 'zookeeper'
      # don't manage alternatives on RHEL
      $alternatives_manage  = false
      $confdir              = '/etc/zookeeper'
      $confdir_altname      = undef
      $confdir_altlink      = undef
      $datadir              = '/var/lib/zookeeper'
      $datadir_mode         = '0755'
      $zoocfg_template      = 'zookeeper/zoo.cfg.erb'
      if ( $facts['os']['name'] == 'Fedora' ) {
        $zkenv_path     = '/etc/zookeeper/zookeeper-env.sh'
        $zkenv_template = 'zookeeper/zkEnv.sh.fedora.erb'
      } else {
        if ( (0 + $facts['os']['release']['major']) > 6 ) {
          $zkenv_path     = '/etc/sysconfig/zookeeper'
          $zkenv_template = 'zookeeper/zkEnv.sh.el7.erb'
        } else {
          $zkenv_path     = '/etc/zookeeper/conf/environment'
          $zkenv_template = 'zookeeper/zkEnv.sh.el6.erb'
        }
      }
    }
    /(Debian|debian|Ubuntu|ubuntu)/: {
      $package_name         = [ 'zookeeperd', 'zookeeper', 'zookeeper-bin' ]
      $service_name         = 'zookeeper'
      # manage config through alternatives on Debian
      $alternatives_manage  = true
      $confdir              = '/etc/zookeeper/conf_active'
      $confdir_altname      = 'zookeeper-conf'
      $confdir_altlink      = '/etc/zookeeper/conf'
      $datadir              = '/var/lib/zookeeper'
      $datadir_mode         = '0750'
      $zoocfg_template      = 'zookeeper/zoo.cfg.erb'
      $zkenv_template       = 'zookeeper/zkEnv.sh.deb.erb'
      $zkenv_path           = '/etc/zookeeper/conf/environment'
    }
  }
}
