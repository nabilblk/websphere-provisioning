websphere_app_server { 'AppServer01':
  ensure       => 'present',
  node         => 'appNode01',
  dmgr_profile => 'PROFILE_DMGR_01',
  profile_base => '/opt/IBM/WebSphere/AppServer/profiles',
}
