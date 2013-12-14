node default {
  
}

node "byron-pc.home" {
	package { 'notepadplusplus.install':
        ensure          => installed,
        provider        => 'chocolatey',
        install_options => '-pre'
    }	
}