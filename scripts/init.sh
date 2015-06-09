#!/bin/bash

curl -sSfL http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm --output /tmp/cdh.rpm
curl -sSfL http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera --output /tmp/cdh.key
rpm --import /tmp/cdh.key
yum localinstall -y -q /tmp/cdh.rpm

yum install -y java-1.8.0-openjdk zookeeper

#why?
/etc/init.d/iptables stop

# chmod scripts
chmod u+x /vagrant/scripts/*.sh
