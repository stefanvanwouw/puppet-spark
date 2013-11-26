class spark (
    $install_dir
) {
    require spark::user


    # Better would be if they had a package repository available, but they do not at this moment.
    # (Nor do I, so this is the cleanest way without package managers).
    file {$install_dir:
        ensure  => directory,
        source  => 'puppet:///modules/spark/spark',
        mode    => '0744',
        recurse => true,
        owner   => 'root',
        group   => 'root',
        require => User['spark'],
    }


    # Create log dir for logging.
    file {'/var/log/spark':
        ensure => directory,
        owner   => 'root',
        group   => 'root',
    }
 

    

    

}
