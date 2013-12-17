node default {
  
}

node "byron-pc.home" {
	file { 'c:/temp/puppet.txt':
		ensure	=> present
	}
	
	$packages = ['notepadplusplus.install','cwrsync']
	package { $packages:
        ensure          => installed,
        provider        => 'chocolatey',
    }	
}