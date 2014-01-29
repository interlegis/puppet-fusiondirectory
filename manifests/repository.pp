#repository.pp

class fusiondirectory::repository {

	## Repository
        include apt
        apt::sources_list { "fusiondirectory":
                content => "deb http://repos.fusiondirectory.org/debian stable main",
        }
	apt::sources_list { "fusiondirectory_extra":
                content => "deb http://repos.fusiondirectory.org/debian-extra stable main",
        }
        apt::key { "62B4981F":
                source => "http://repos.fusiondirectory.org/gpg/fusiondirectory_public.key"
        }

}
