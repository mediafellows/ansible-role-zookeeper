[![Build Status](https://travis-ci.com/mediapeers/ansible-role-zookeeper.svg?branch=master)](https://travis-ci.com/mediapeers/ansible-role-zookeeper)

# Ansible role for Apache ZooKeeper

Ansible role to install and configure [Apache Zookeeper](http://zookeeper.apache.org/). Also installs Java and a systemd config for you to run zookeeper right away.

Install this role by either cloning this repo as a submodule into your Ansible project or using Ansible Galaxy.

## Requirements

No special requirements. Designed for Ubuntu server 16.04. But might work on any other Debian based distro.

## Role Variables

For role variables check `defaults/main.yml`.

The most important ones (that you most likely want to chagne) are listed here (with their default values):

* `zookeeper_version: 3.4.12` - Version of Zookeeper to install
* `zookeeper_java_install: true` - Set to false if you don't want this role to install Java for you
* `zookeeper_data_dir: /var/lib/zookeeper` - Where ZooKeeper stores it's data
* `zookeeper_autopurge_interval: 0` - You probably want to set this to a non zero value to cleanup old snaphots frequently. Interval in hours.
* `zookeeper_servers: [ { id: "0", hostname: "127.0.0.1", ports: "2888:3888" } ]` - List of servers in the cluster, with their params.
* `zookeeper_my_server_id: 0` - Set it to an ID that exists in the list of cluster servers.

For more info on how to set this variables consult the [ZooKeeper deployment documentation](https://zookeeper.apache.org/doc/r3.3.3/zookeeperAdmin.html#ch_deployment).

## Dependencies

Depends on other Ansible roles.

## Example Playbook

Example playbook using this role:

    - name: Zookeeper play
      hosts: servers
      become: true
      vars:
        zookeeper_version: 3.4.13
        zookeeper_autopurge_interval: 1
        zookeeper_my_server_id: 0
        zookeeper_servers:
          - { id: 0, hostname: 'node0.zookeeper.internal', ports: "2888:3888" }
          - { id: 1, hostname: 'node1.zookeeper.internal', ports: "2888:3888" }
          - { id: 2, hostname: 'node2.zookeeper.internal', ports: "2888:3888" }
      roles:
         - mediapeers.zookeeper

## License

BSD

## Author Information

Stefan Horning <horning@mediapeers.com>
