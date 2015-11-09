FROM centos:centos7
RUN rpm --import https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs @&& \
    rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

# Need to enable centosplus for the image libselinux issue
RUN yum install -y yum-utils
RUN yum-config-manager --enable centosplus

RUN yum install -y puppet tar
RUN puppet module install joshbeard-websphere
RUN puppet module install joshbeard-ibm_installation_manager
ADD puppet /home/
RUN mv /home/module/appserver.pp /etc/puppet/modules/websphere/manifests/profile/
RUN cd /home/ ; chmod u+x install.sh ;  chmod u+x configure.sh ; chmod u+x start.sh
VOLUME ["/download/was"]
EXPOSE 9060 9080 9443
