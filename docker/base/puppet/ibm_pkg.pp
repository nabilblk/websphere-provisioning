ibm_pkg { 'com.ibm.websphere.NDTRIAL.v85':
  ensure     => 'present',
  package    => 'com.ibm.websphere.NDTRIAL.v85',
  version    => '8.5.5000.20130514_1044',
  target     => '/opt/IBM/WebSphere/AppServer',
  repository => '/download/was/WAS/repository.config',
}
