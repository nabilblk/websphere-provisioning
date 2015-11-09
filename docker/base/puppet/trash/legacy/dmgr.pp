# Manage a DMGR
#
# Install a WebSphere instance of 8.5, a fixpack, and Java 7.
#
# Create a profile for the DMGR and a cluster.
#
class profile::websphere::dmgr { # lint:ignore:autoloader_layout
$base_dir         = '/opt/IBM'
$instance_name    = 'WebSphere'
$instance_base    = "${base_dir}/${instance_name}/AppServer"
$profile_base     = "${instance_base}/profiles"
$dmgr_profile     = 'PROFILE_DMGR_02'
$dmgr_cell        = 'CELL_02'
$dmgr_node        = 'NODE_DMGR_02'


## Create a DMGR Profile
websphere::profile::dmgr { $dmgr_profile:
    instance_base => $instance_base,
    profile_base  => $profile_base,
    cell          => $dmgr_cell,
    node_name     => $dmgr_node,
  }

## Create a cluster
websphere::cluster { 'PuppetCluster01':
    profile_base => $profile_base,
    dmgr_profile => $dmgr_profile,
    cell         => $dmgr_cell,
    user         => $user,
    require      => Websphere::Profile::Dmgr[$dmgr_profile],
  }

}