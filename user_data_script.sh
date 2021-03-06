#!/bin/sh
set -e -x

apt-get --yes --quiet update
apt-get --yes --quiet install git puppet-common apache2

#
# Fetch puppet configuration from public github repository.
#

mv /etc/puppet /etc/puppet.orig
git clone https://github.com/breval/ec2.git /etc/puppet

#
# Run puppet, build site.
#

puppet apply /etc/puppet/manifests/init.pp

#
# Load eval virtual site and restart service - keep it simple
#
a2ensite eval
service apache2 reload
