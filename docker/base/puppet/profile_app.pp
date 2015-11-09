# Example Application Server profile
websphere::profile::appserver { 'PROFILE_APP_01':
  instance_base  => '/opt/IBM/WebSphere/AppServer',
  profile_base   => '/opt/IBM/WebSphere/AppServer/profiles',
  template_path  => '/opt/IBM/WebSphere/AppServer/profileTemplates/managed',
  cell           => 'CELL_01',
  node_name      => 'appNode01',
}
