#!/bin/bash

# Script: provision.sh
# Author: Nick Schuch

DIR='/vagrant'

export FACTER_role=management
cd ${DIR} && sudo -E bundle exec puppet apply --modulepath modules --hiera_config=etc/hiera.yaml site.pp
