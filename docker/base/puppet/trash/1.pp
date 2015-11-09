websphere::profile::appserver { 'PROFILE_APP_003':
    instance_base  => '/opt/IBM/WebSphere/AppServer',
    profile_base   => '/opt/IBM/WebSphere/AppServer/profiles',
    template_path  => "${instance_base}/profileTemplates/managed",
    dmgr_host      => $dmgr_host,
    cell           => 'CELL_01',
    node_name      => 'dmgrNode01',
    manage_sdk     => false,
    sdk_name       => '1.7.1_64',
    manage_service => true,
}