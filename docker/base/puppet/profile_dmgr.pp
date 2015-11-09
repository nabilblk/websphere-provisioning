# Example DMGR profile
websphere::profile::dmgr { 'PROFILE_DMGR_01':
  instance_base => '/opt/IBM/WebSphere/AppServer',
  profile_base  => '/opt/IBM/WebSphere/AppServer/profiles',
  cell          => 'CELL_01',
  node_name     => 'dmgrNode01',
}
