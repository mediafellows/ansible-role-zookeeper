# Ansible role zookeeper

Ansible role to install and configure [Apache Zookeeper](http://zookeeper.apache.org/). Also installs Java and a systemd config for you to run zookeeper right away.

Install this role by either cloning this repo as a submodule into your Ansible project or using Ansible Galaxy.

## Requirements

No special requirements. Designed for Ubuntu server 16.04. But might work on any other Debian based distro.

## Role Variables

* `zookeeper_version: 3.4.12` - Version of Zookeeper to install

## Dependencies

Depends on other Ansible roles.

## Example Playbook

Example playbook using this role:

    - name: Zookeeper play
      hosts: servers
      become: true
      vars:
        zookeeper_version: 3.4.13
      roles:
         - mediapeers.zookeeper

## License

BSD

## Author Information

Stefan Horning <horning@mediapeers.com>
