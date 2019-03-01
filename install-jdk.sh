#!/bin/bash

BASE_SERVER=https://download.oracle.com
wget $BASE_SERVER/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-arm64-vfp-hflt.tar.gz
tar -xvf jdk-8u201-linux-arm64-vfp-hflt.tar.gz -C /usr/local
cat >> /etc/profile << EOF
export JAVA_HOME=/usr/local/jdk1.8.0_201
export PATH=\$PATH:\$JAVA_HOME/bin
EOF