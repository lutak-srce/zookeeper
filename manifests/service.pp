# @summary
#   This class handles the zookeeper service.
#
# @api private
#
class zookeeper::service inherits zookeeper {

  if $zookeeper::service_manage == true {
    service { 'zookeeper':
      ensure     => $zookeeper::service_ensure,
      enable     => $zookeeper::service_enable,
      name       => $zookeeper::service_name,
      provider   => $zookeeper::service_provider,
      hasstatus  => $zookeeper::service_hasstatus,
      hasrestart => $zookeeper::service_hasrestart,
    }
  }

}
