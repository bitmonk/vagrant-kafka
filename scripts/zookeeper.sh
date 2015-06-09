#!/bin/bash

# create myid file. see http://zookeeper.apache.org/doc/r3.1.1/zookeeperAdmin.html#sc_zkMulitServerSetup
if [ ! -d /tmp/zookeeper ]; then
    /usr/lib/zookeeper/bin/zkServer-initialize.sh
    echo $1 > /tmp/zookeeper/myid
fi
# echo starting zookeeper 
/usr/lib/zookeeper/bin/zkServer.sh start
