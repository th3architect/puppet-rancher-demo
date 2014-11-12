Puppet - Rancher (Demo)
=======================

## Overview

A demo puppet manifest of using the puppet-rancher project.

## Provision

### Hiera

All nodes need facter environment variables before provisioning. Below are examples of what those can be.

**Management**

* FACTER_role=management

**Node**

* FACTER_role=node
* FACTER_management=localhost

### Apply

```
bundle --path vendor/bundle
bundle exec librarian-puppet install
sudo -E bundle exec puppet apply --modulepath modules --hiera_config=etc/hiera.yaml site.pp
```
