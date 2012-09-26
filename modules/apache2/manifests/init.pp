class apache2 {
    package { 'apache2':
        ensure  => installed,
    }

    service { 'apache2':
        ensure => running,
        enable => true,
        require => Package["apache2"],
		}
		    
    		file { "/var/www/eval/index.html":
  			source => 'puppet:///private/www/index.html',
  			require => Package['apache2']
  			
		}

                file { "/etc/apache2/sites-available/eval":
                        source => 'puppet:///private/www/eval',
                        require => Package['apache2']

                }

}
