node default {
  
}

node "byron-pc.home" {
	file { 'c:/temo/puppet.txt':
		ensure	=> present
	}
	
	package { 'notepadplusplus.install':
        ensure          => installed,
        provider        => 'chocolatey',
        install_options => '-pre'
    }	
}