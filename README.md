# Vagrant Neo4j

A [vagrant](http://vagrantup.com) configuration to run Neo4j in a VirtualBox.

The setup script is a simple bash shell script (no chef/puppet/etc). I wanted a simple, lightweight, and standalone script to build my environment, but it may not be appropriate for everyone's needs.

## Installs

Running `vagrant up` will download and install:

* Ubuntu 14.04 LTS (Base Box) `trusty64 http://files.vagrantup.com/trusty64.box`

* [Oracle Java](http://www.java.com/) JRE `1.7.0u45`
> By downloading Java you acknowledge that you have read and accepted the terms of the [end user license agreement](http://www.oracle.com/technetwork/java/javase/terms/license/)

* [Neo4j](http://www.neo4j.org/) Community Edition `3.0.3`
> (A)GPLv3 License<br>
> Port 7474 is forwarded from the host to the guest for accessing Neo4j from the host machine.

## Requirements

* [VirtualBox](https://www.virtualbox.org/) (version 4.2 or later)
* [Vagrant](http://www.vagrantup.com/)
