#init.pp

class fusiondirectory (	$rootDn		= undef,
			$ldapserver	= undef,
			$adminDn 	= "cn=admin,${rootDn}",
			$adminPw 	= undef,
			$plugins 	= [ ],
			$tls     	= false,
			$tls_cacert     = '/etc/ssl/certs/cacert.crt', 
			) {

	if !$rootDn or !$ldapserver or !adminPw {
		fail("rootDn, ldapserver and adminPw variables required!")
	}
	
	include fusiondirectory::repository		

	## Packages
	package { "fusiondirectory": 
		ensure => installed,
		require => [ 	Apt::Sources_list["fusiondirectory"],
				Apt::Key["62B4981F"],
		],
	}
	package { "php-mdb2":
		ensure => installed,
	}

	## Config file

	file { "/etc/fusiondirectory/fusiondirectory.conf":
		owner => root, group => www-data, mode => 640,
		content => template('fusiondirectory/fusiondirectory.conf.erb'),
	}

	## Plugins
	define plugin {
		package { "fusiondirectory-plugin-${name}":
			ensure => installed,		
		}
	}
	plugin { $plugins: }

        if $tls == true {
		file { "/etc/ldap": ensure => directory }
		file { "/etc/ldap/ldap.conf":
                	owner => root, group => www-data, mode => 444,
                	content => template('fusiondirectory/ldap.conf.erb'),
        	}
        }
}
