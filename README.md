#zookeeper [![Build Status](https://travis-ci.org/lutak-srce/zookeeper.svg)](https://travis-ci.org/lutak-srce/zookeeper)

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with zookeeper](#setup)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)

##Overview

The zookeeper module installs, configures, and manages the [ZooKeeper](https://zookeeper.apache.org/),
highy reliable distributed coordinator.

##Module Description

The zookeeper module handles installing, configuring, and running ZooKeeper across a range of operating systems and distributions.

##Setup

###Beginning with zookeeper

`include '::zookeeper::server'` is enough to get you up and running.  If you wish to pass in parameters specifying which servers to use, then:

```puppet
class { '::zookeeper::server':
  servers => [ 'zoo1.example.lan', 'zoo2.example.lan', 'zoo3.example.lan' ],
}
```

##Usage

All interaction with the zookeeper module can be done through the `zookeeper::server` class. This means you can simply toggle the options in `::zookeeper::server` to have full functionality of the module.

##Reference

##Limitations

This module has been tested on CentOS 6 and 7.

##Development

Everybody is welcome to contribute. We adhere to [NCoC](CODE_OF_CONDUCT.md) and are not interested in politics but in meritocracy.

###Contributors

To see who's already involved, see the [list of contributors.](https://github.com/lutak-srce/zookeeper/graphs/contributors)
