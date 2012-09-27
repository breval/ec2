class apache2 {
    package { 'apache2':
        ensure  => installed,
    }

    service { 'apache2':
        ensure => running,
        enable => true,
		}
		    
    		file { "/var/www/eval/":
			ensure => directory,
		}

		file { "/var/www/eval/index.html":
         		ensure => present,
         		source => "/etc/puppet/private/www/index.html",
                }

                file { "/etc/apache2/sites-available/eval":
			ensure => present,
                        source => "/etc/puppet/private/www/eval",
                }
}
