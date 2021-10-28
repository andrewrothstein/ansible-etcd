andrewrothstein.etcd
====================
![Build Status](https://github.com/andrewrothstein/ansible-etcd/actions/workflows/build.yml/badge.svg)


Installs [etcd](https://github.com/coreos/etcd)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
	- andrewrothstein.etcd
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
