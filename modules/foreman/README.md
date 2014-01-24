# Puppet module: foreman

This is a Puppet module for foreman based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-foreman

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.

## USAGE - Basic management

* Install foreman with default settings

        class { 'foreman': }

* Install a specific version of foreman package

        class { 'foreman':
          version => '1.0.1',
        }

* Disable foreman service.

        class { 'foreman':
          disable => true
        }

* Remove foreman package

        class { 'foreman':
          absent => true
        }

* Enable auditing without without making changes on existing foreman configuration files

        class { 'foreman':
          audit_only => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'foreman':
          source => [ "puppet:///modules/lab42/foreman/foreman.conf-${hostname}" , "puppet:///modules/lab42/foreman/foreman.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'foreman':
          source_dir       => 'puppet:///modules/lab42/foreman/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'foreman':
          template => 'example42/foreman/foreman.conf.erb',
        }

* Automatically include a custom subclass

        class { 'foreman':
          my_class => 'foreman::example42',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'foreman':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'foreman':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'foreman':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'foreman':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


[![Build Status](https://travis-ci.org/example42/puppet-foreman.png?branch=master)](https://travis-ci.org/example42/puppet-foreman)
