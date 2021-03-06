#!/bin/bash

# Script: provision.sh
# Author: Nick Schuch

DIR='/vagrant'

# Helper function to install packages.
aptInstall() {
  COUNT=`dpkg --get-selections $1 | grep -v deinstall | wc -l`
  if [ "$COUNT" -eq "0" ]; then
    apt-get -y update > /dev/null
    apt-get -y install $1
  fi
}

# Helper function to install gems packages.
gemInstall() {
  COUNT=`gem list | grep $1 | wc -l`
  if [ "$COUNT" -eq "0" ]; then
    gem install $1
  fi
}

# Install the required packages.
aptInstall curl
aptInstall wget
aptInstall git
aptInstall ruby1.9.1-dev
aptInstall make
aptInstall vim
gemInstall bundler

# Prepare.
cd ${DIR} && bundle --path vendor/bundle
cd ${DIR} && bundle exec librarian-puppet install
