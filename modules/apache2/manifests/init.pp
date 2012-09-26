class apache2 {
    package { 'apache2':
        ensure  => installed,
    }

    service { 'apache2':
        ensure => running,
        enable => true,
#        require => Package["apache2"],
		}
		    
    		file { "/var/www/eval/":
			ensure => directory,
#  			require => Package['apache2']	
		}

		file { "/var/www/eval/index.html":
         		ensure => present,
         		source => "/etc/puppet/private/www/index.html",
#         		require => Package['apache2']
                }

                file { "/etc/apache2/sites-available/eval":
			ensure => present,
                        source => "/etc/puppet/private/www/eval",
#                        require => Package['apache2']
                }

		exec { "enable virtual site - apache":
    			command => "a2ensite eval",
    			path    => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
		}

		exec { "bounce apache":
    			command => "service apache2 reload",
    			path    => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
			}
}
