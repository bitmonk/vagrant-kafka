#!/bin/bash

KAFKA_PACKAGE_NAME="kafka-0.8.2_beta1-3.el6.x86_64.rpm"

curl -sSfL http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm --output /tmp/cdh.rpm
curl -sSfL http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera --output /tmp/cdh.key
rpm --import /tmp/cdh.key
yum localinstall -y -q /tmp/cdh.rpm

yum install -y java-1.6.0-openjdk zookeeper

cd /vagrant/rpm
if [ ! -d ${KAFKA_PACKAGE_NAME} ]; then
  curl -sSfL https://github.com/bitmonk/kafka-rpm/releases/download/0.1/${KAFKA_PACKAGE_NAME} --output ${KAFKA_PACKAGE_NAME}
fi
rpm -ivh ${KAFKA_PACKAGE_NAME}

#why?
/etc/init.d/iptables stop

# chmod scripts
chmod u+x /vagrant/scripts/*.sh
