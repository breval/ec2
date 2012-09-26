#!/bin/sh
set -e -x

apt-get --yes --quiet update
apt-get --yes --quiet install git puppet-common

#
# Fetch puppet configuration from public github repository.
#

mv /etc/puppet /etc/puppet.orig
git clone https://github.com/breval/ec2.git /etc/puppet

#
# Run puppet.
#

puppet apply /etc/puppet/manifests/init.pp
