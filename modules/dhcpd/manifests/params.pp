# Class: dhcpd::params
#
# This class defines default parameters used by the main module class dhcpd
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to dhcpd class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class dhcpd::params {

  $source_init = ''
  $template_init = ''

  # Cope with Debian's folies
  $debian_isc_era = $::operatingsystem ? {
    /(?i:Ubuntu)/ => $::lsbmajdistrelease ? {
      8       => '5',
      9       => '5',
      default => '6',
    },
    /(?i:Debian)/ => $::lsbmajdistrelease ? {
      5       => '5',
      default => '6',
    },
    default   => '6',
  }

  ### Application related parameters

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => $debian_isc_era ? {
      5 => 'dhcp3-server',
      6 => 'isc-dhcp-server',
    },
    /(?i:SLES|OpenSuSE)/      => 'dhcp-server',
    /(?i:OpenBSD)/            => '',
    default                   => 'dhcp',
  }

  $service = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => $debian_isc_era ? {
      5 => 'dhcp3-server',
      6 => 'isc-dhcp-server',
    },
    default                   => 'dhcpd',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => $debian_isc_era ? {
      5 => 'dhcpd3',
      6 => 'dhcpd',
    },
    default                   => 'dhcpd',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    /(?i:OpenBSD)/ => '_dhcp',
    default        => 'dhcpd',
  }

  $config_dir = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => $debian_isc_era ? {
      5 => '/etc/dhcp3',
      6 => '/etc/dhcp',
    },
    /(?i:SLES|OpenSuSE)/      => '/etc/dhcpd.d',
    /(?i:OpenBSD)/            => '',
    default                   => '/etc/dhcp',
  }

  $config_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => $debian_isc_era ? {
      5 => '/etc/dhcp3/dhcpd.conf',
      6 => '/etc/dhcp/dhcpd.conf',
    },
    /(?i:RedHat|Centos|Scientific|Amazon|Linux)/ => $::lsbmajdistrelease ? {
      5       => '/etc/dhcpd.conf',
      default => '/etc/dhcp/dhcpd.conf',
    },
    default                   => '/etc/dhcpd.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    /(?i:OpenBSD)/ => 'wheel',
    default        => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/dhcp3-server',
    /(?i:OpenBSD)/            => '',
    default                   => '/etc/sysconfig/dhcpd',
  }

  $pid_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => $debian_isc_era ? {
      5 => 'var/run/dhcp3-server/dhcpd.pid',
      6 => 'var/run/dhcp-server/dhcpd.pid',
    },
    /(?i:OpenBSD)/            => '',
    default                   => '/var/run/dhcpd.pid',
  }

  $data_dir = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => $debian_isc_era ? {
      5 => '/var/lib/dhcp3',
      6 => '/var/lib/dhcp',
    },
    /(?i:SLES|OpenSuSE)/      => '/var/lib/dhcp',
    /(?i:OpenBSD)/            => '',
    default                   => '/var/lib/dhcpd',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log',
  }

  $log_file = $::operatingsystem ? {
    default => '',
  }

  $port = '67'
  $protocol = 'udp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false

}
