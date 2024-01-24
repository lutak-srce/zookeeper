[![Build Status](https://travis-ci.org/lutak-srce/zookeeper.svg?branch=master)](https://travis-ci.org/lutak-srce/zookeeper)

# ZooKeeper

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
   * [Validating and unit testing the module](#validating-and-unit-testing-the-module)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

The Puppet zookeeper module installs, configures, and manages the [ZooKeeper](https://zookeeper.apache.org/),
highy reliable distributed coordinator.

## Setup

To install and start Apache ZooKeeper, add a single class to the manifest file:

```puppet
include 'zookeeper::server'
```

To configure it with custom parameters specifying cluster members, add it to manifest like:

```puppet
class { '::zookeeper::server':
  servers => [ 'zoo1.example.lan', 'zoo2.example.lan', 'zoo3.example.lan' ],
}
```

### TLS setup

```
zookeeper::ssl:
  keystore:
    location: '/path/to/keystore'
    password: 'keystore_pass'
  truststore:
    location: '/path/to/truststore'
    password: 'truststore_pass'
  quorum:
    keystore:
      location: '/path/to/keystore'
      password: 'keystore_pass'
    truststore:
      location: '/path/to/truststore'
      password: 'truststore_pass'
```

### Validating and unit testing the module

This module is compliant with the Puppet Development Kit [(PDK)](https://puppet.com/docs/pdk/1.x/pdk.html), which
 provides tools to help run unit tests on the module and validate the modules's metadata, syntax, and style.

To run all validations against this module, run the following command:

```
pdk validate
```

To change validation behavior, add options flags to the command. For a complete list of command options and usage
 information, see the PDK command [reference](https://puppet.com/docs/pdk/1.x/pdk_reference.html#pdk-validate-command).

To unit test the module, run the following command:

```
pdk test unit
```

To change unit test behavior, add option flags to the command. For a complete list of command options and usage
information, see the PDK command [reference](https://puppet.com/docs/pdk/1.x/pdk_reference.html#pdk-test-unit-command).

## Usage

All interaction with the zookeeper module can be done through the `zookeeper::server` class. This means you can simply toggle the options in `::zookeeper::server` to have full functionality of the module.

## Reference

## Limitations

This module has been tested on:

* CentOS 6
* CentOS 7

## Development

Everybody is welcome to contribute. We adhere to [NCoC](CODE_OF_CONDUCT.md) and are not interested in politics but in meritocracy.
