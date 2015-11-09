class appserver { # lint:ignore:autoloader_layout
$base_dir         = '/opt/IBM'
$instance_name    = 'WebSphere'
$instance_base    = '${base_dir}/${instance_name}/AppServer'
$profile_base     = '${instance_base}/profiles'
$template_path    = '${instance_base}/profileTemplates/managed'
$dmgr_host        = '${::fqdn}'
$dmgr_profile     = 'PROFILE_DMGR_01'
$dmgr_cell        = 'CELL_01'
$profile_name     = 'PROFILE_APP_01'
$node_name        = 'appNode01'

# Example Application Server profile
websphere::profile::appserver { $profile_name:
  instance_base  => $instance_base,
  profile_base   => $profile_base,
  template_path  => '/opt/IBM/WebSphere/AppServer/profileTemplates/managed',
  cell           => 'CELL_01',
  node_name      => $node_name,
  options        => '-create -profileName ${profile_name} -profilePath ${profile_base}/${profile_name} -templatePath ${template_path} -nodeName ${node_name} -hostName $dmgr_host -federateLater false -cellName standalone'

}
}
