#schemas.pp

class fusiondirectory::schemas ( 	$plugins = [ ],
				) {
	include fusiondirectory::repository

	package { "fusiondirectory-schema":
		ensure => installed,
		require => Class["fusiondirectory::repository"],
	}

	## Plugin Schemas
	define plugin {
                package { "fusiondirectory-plugin-${name}-schema":
                        ensure => installed,
			require => Class["fusiondirectory::repository"],
                }
        }
        plugin { $plugins: }
}
