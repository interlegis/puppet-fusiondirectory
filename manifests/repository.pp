#repository.pp

class fusiondirectory::repository {

	## Repository
        include apt
        
        apt::source { 'fusiondirectory':
  		location          => 'http://repos.fusiondirectory.org/debian-wheezy',
  		release           => 'wheezy',
  		repos             => 'main',
	}
	apt::source { 'fusiondirectory_extra':
                location          => 'http://repos.fusiondirectory.org/debian-extra',
                release           => 'wheezy',
                repos             => 'main',
        }

        apt::key { "fusiondirectory":
                key => '62B4981F',
                key_source => "https://github.com/fusiondirectory/fusiondirectory-gpg-keys/raw/master/fusiondirectory_public.key"
        }

}
