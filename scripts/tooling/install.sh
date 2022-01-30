#!/bin/bash

# echo
# echo ">>>>Source internal variables"
# . ../internal-variables.sh

# echo
# echo ">>>>Source variables"
# . ../variables.sh

echo
echo ">>>>Source functions"
. ../functions.sh

echo
echo ">>>>Tooling install started"

if [[ $CONTAINER_RUN_MODE == "true" ]]; then
  echo
  echo ">>>>$(print_timestamp) Install Python3 package"
  yum install python3 -y
  exit_test $? "Install Python3 Failed"

  echo
  echo ">>>>$(print_timestamp) Setup Pip"
  pip3 install --upgrade setuptools	--user
  exit_test $? "Setup Pip setuptools Failed"
  pip3 install --upgrade pip --user
  exit_test $? "Setup Pip upgrade Failed"

  echo
  echo ">>>>$(print_timestamp) Install pip package wheel"
  pip3 install --user wheel
  exit_test $? "Install pip package wheel failed"

  echo
  echo ">>>>$(print_timestamp) Install pip package ansible"
  pip3 install ansible==2.9.27 --user
  exit_test $? "Install pip package ansible failed"
fi

echo
echo ">>>>$(print_timestamp) Install pip package openshift"
pip3 install --user openshift
exit_test $? "Install pip package openshift failed"

echo
echo ">>>>$(print_timestamp) Install pip package jmespath"
pip3 install --user jmespath
exit_test $? "Install pip package jmespath failed"

# if [[ $CONTAINER_RUN_MODE == "true" ]]; then
#   echo
#   echo ">>>>$(print_timestamp) Install OpenSSL package"
#   yum install openssl -y
#   exit_test $? "Install OpenSSL Failed"
#   sleep 5
# fi

# echo
# echo ">>>>$(print_timestamp) Install OpenJDK to provide keytool"
# curl -O https://download.java.net/java/GA/jdk9/9/binaries/openjdk-9_linux-x64_bin.tar.gz
# exit_test $? "Download OpenJDK to provide keytool Failed"
# tar -xvf openjdk-9_linux-x64_bin.tar.gz
# ln -fs jdk-9/bin/java java
# ln -fs jdk-9/bin/javac javac
# ln -fs jdk-9/bin/keytool keytool
# ./java -version
# exit_test $? "java setup Failed"
# sleep 5

# echo
# echo ">>>>$(print_timestamp) Install jq"
# curl -L -o jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux32
# exit_test $? "Download jq Failed"
# chmod u+x jq
# ./jq --version
# exit_test $? "jq setup Failed"
# sleep 5

# echo
# echo ">>>>$(print_timestamp) Install yq"
# curl -L -o yq https://github.com/mikefarah/yq/releases/download/3.4.1/yq_linux_amd64
# exit_test $? "Download yq Failed"
# chmod u+x yq
# ./yq --version
# exit_test $? "yq setup Failed"
# sleep 5

# echo
# echo ">>>>$(print_timestamp) Install oc"
# curl -k https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz --output oc.tar
# exit_test $? "Download oc Failed"
# tar -xvf oc.tar oc
# chmod u+x oc
# ./oc version
# exit_test $? "oc setup Failed"
# sleep 5

echo
echo ">>>>$(print_timestamp) Install helm"
curl -O https://get.helm.sh/helm-v3.6.0-linux-amd64.tar.gz
exit_test $? "Download helm Failed"
tar -zxvf helm-v3.6.0-linux-amd64.tar.gz linux-amd64/helm
mv linux-amd64/helm helm
chmod u+x helm
./helm version
exit_test $? "helm setup Failed"
sleep 5

# echo
# echo ">>>>$(print_timestamp) Install maven"
# curl -k -O https://archive.apache.org/dist/maven/maven-3/3.8.2/binaries/apache-maven-3.8.2-bin.tar.gz
# exit_test $? "Download maven Failed"
# tar -xvf apache-maven-3.8.2-bin.tar.gz
# ln -fs apache-maven-3.8.2/bin/mvn mvn
# OLD_PATH=$PATH
# PATH=`realpath .`:$PATH
# ./mvn --version
# exit_test $? "maven setup Failed"
# PATH=$OLD_PATH


echo
echo ">>>>$(print_timestamp) Tooling install completed"
