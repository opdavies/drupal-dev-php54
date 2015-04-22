A CentOS based virtual machine, running Apache, PHP 5.4 and MySQL for local Drupal 7 and 8 development.

## Dependencies

* [VirtualBox](https://www.virtualbox.org).
* [Vagrant](http://vagrantup.com)

## Puppet

To install the dependencies locally:
* `$ cd puppet`
* `$ bundle install` (installs puppet and librarian-puppet gems)
* `$ bundle exec librarian-puppet install` (installs the defined modules)
