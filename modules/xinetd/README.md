# Puppet module: xinetd

This is a Puppet xinetd module from the second generation of Example42 Puppet Modules.

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-xinetd

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module.

For detailed info about the logic and usage patterns of Example42 modules read README.usage on Example42 main modules set.

## USAGE - Basic management

* Install xinetd with default settings

        class { "xinetd": }

* Disable xinetd service.

        class { "xinetd":
          disable => true
        }

* Disable xinetd service at boot time, but don't stop if is running.

        class { "xinetd":
          disableboot => true
        }

* Remove xinetd package

        class { "xinetd":
          absent => true
        }

* Enable auditing without without making changes on existing xinetd configuration files

        class { "xinetd":
          audit_only => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { "xinetd":
          source => [ "puppet:///modules/lab42/xinetd/xinetd.conf-${hostname}" , "puppet:///modules/lab42/xinetd/xinetd.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { "xinetd":
          source_dir       => "puppet:///modules/lab42/xinetd/conf/",
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file 

        class { "xinetd":
          template => "example42/xinetd/xinetd.conf.erb",      
        }

* Define custom options that can be used in a custom template without the
  need to add parameters to the xinetd class

        class { "xinetd":
          template => "example42/xinetd/xinetd.conf.erb",    
          options  => {
            'LogLevel' => 'INFO',
            'UsePAM'   => 'yes',
          },
        }

* Automaticallly include a custom subclass

        class { "xinetd:"
          my_class => 'xinetd::example42',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)
  Note that this option requires the usage of Example42 puppi module

        class { "xinetd": 
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with
  a puppi::helper define ) to customize the output of puppi commands 

        class { "xinetd":
          puppi        => true,
          puppi_helper => "myhelper", 
        }

* Activate automatic monitoring (recommended, but disabled by default)
  This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { "xinetd":
          monitor      => true,
          monitor_tool => [ "nagios" , "monit" , "munin" ],
        }

* Activate automatic firewalling 
  This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { "xinetd":       
          firewall      => true,
          firewall_tool => "iptables",
          firewall_src  => "10.42.0.0/24",
          firewall_dst  => "$ipaddress_eth0",
        }


[![Build Status](https://travis-ci.org/example42/puppet-xinetd.png?branch=master)](https://travis-ci.org/example42/puppet-xinetd)
