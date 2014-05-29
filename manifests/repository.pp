#repository.pp

class fusiondirectory::repository {

	## Repository
        include apt
        
        apt::source { 'fusiondirectory':
  		location          => 'http://repos.fusiondirectory.org/debian',
  		release           => 'stable',
  		repos             => 'main',
	}
	apt::source { 'fusiondirectory_extra':
                location          => 'http://repos.fusiondirectory.org/debian-extra',
                release           => 'stable',
                repos             => 'main',
        }

        apt::key { "fusiondirectory":
                key => '62B4981F',
                key_source => "http://repos.fusiondirectory.org/gpg/fusiondirectory_public.key"
        }

}
