class spark::master (
    $master_port = $::spark::defaults::master_port,
    $web_port    = $::spark::defaults::web_port,
    $install_dir = $::spark::defaults::install_dir,
) inherits spark::defaults {

    class {'spark':
        install_dir => $install_dir,
    }
    Class['spark'] -> Class['spark::master']

    # The Upstart service file.
    file {'/etc/init/spark-master.conf':
        content => template('spark/spark-master.conf.erb'),
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        notify  => Service['spark-master'], 
    } 

    file { "${install_dir}/bin/spark-master-runner.sh":
        content => template('spark/spark-master-runner.sh.erb'),
        owner   => 'root',
        group   => 'root',
        mode    => '0744',
    }

    # The service that runs the master server. 
    service {'spark-master': 
        ensure   => running, 
        provider => 'upstart',
        require  => [File['/etc/init/spark-master.conf'], File["${install_dir}/bin/spark-master-runner.sh"]], 
    }

}
