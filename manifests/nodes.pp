class test {
}

node default {
  include test  
}

node "byron-pc.home" {
	file { "c:/puppet.test":
		ensure	=> exists,
		content	=> "success",
	}
}