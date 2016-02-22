

class apache_php {

  package { "apache2":
    ensure  => installed,
    require => Class["system-update"],
  }

  service { "apache2":
    ensure  => "running",
    require => Package["apache2"],
       subscribe => [
              File["/etc/apache2/mods-enabled/rewrite.load"],
            ]
  }


# ensures that mode_rewrite is loaded and modifies the default configuration file
  file { "/etc/apache2/mods-enabled/rewrite.load":
    ensure => link,
    target => "/etc/apache2/mods-available/rewrite.load",
    require => Package["apache2"]
  }

}