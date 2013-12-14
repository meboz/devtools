node default {
  
}

node "byron-pc.home" {
	package { 'notepadplusplus':
        ensure          => installed,
        provider        => 'chocolatey',
        install_options => '-pre'
    }	
}