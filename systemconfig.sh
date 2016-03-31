#!/bin/bash

DIRECTORYLIST="${JENKINS_HOME}"

for dir in ${DIRECTORYLIST}; do
  mkdir -p ${dir}
  chown -R jenkins:jenkins ${dir}
  chmod -R 775 ${dir}
done

BINLIST='/usr/bin /usr/local/bin /etc/ssh/sshd_config'

for bin in ${BINLIST}; do
  chmod -R 777 ${bin}
done
