#!/bin/bash

#bootstrap server
/opt/kafka-0.8.2_beta1/bin/kafka-server-start.sh /vagrant/config/server$1.properties &
