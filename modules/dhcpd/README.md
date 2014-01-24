# Puppet module: dhcpd

This is a Puppet module for ISC dhcpd based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-dhcpd

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.


## USAGE - Module specific

* Install dhcpd with custom templates for dhcpd.conf and sysconfig init conf file
  It provides also arbitrary custom options can ccan be used on both templates with the
  options_lookup function

        class { 'dhcpd':
          template      => 'example42/dhcpd/dhcpd.conf.erb',
          template_init => 'example42/dhcpd/dhcpd.init.erb',
          options       => {
            'Listen => 'eth0',
            'ddns-update-style => 'none',
          }
        }


## USAGE - Basic management

* Install dhcpd with default settings

        class { 'dhcpd': }

* Install a specific version of dhcpd package

        class { 'dhcpd':
          version => '1.0.1',
        }

* Disable dhcpd service.

        class { 'dhcpd':
          disable => true
        }

* Remove dhcpd package

        class { 'dhcpd':
          absent => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'dhcpd':
          source => [ "puppet:///modules/example42/dhcpd/dhcpd.conf-${hostname}" , "puppet:///modules/example42/dhcpd/dhcpd.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'dhcpd':
          source_dir       => 'puppet:///modules/example42/dhcpd/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'dhcpd':
          template => 'example42/dhcpd/dhcpd.conf.erb',
        }

* Automatically include a custom subclass

        class { 'dhcpd':
          my_class => 'example42::my_dhcpd',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'dhcpd':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'dhcpd':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'dhcpd':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'dhcpd':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }



[![Build Status](https://travis-ci.org/example42/puppet-dhcpd.png?branch=master)](https://travis-ci.org/example42/puppet-dhcpd)
