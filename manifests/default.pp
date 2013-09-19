exec { "apt-get update":
    command => "/usr/bin/apt-get update",
    onlyif => "/bin/sh -c '[ ! -f /var/cache/apt/pkgcache.bin ] || /usr/bin/find /etc/apt/* -cnewer /var/cache/apt/pkgcache.bin | /bin/grep . > /dev/null'",
}

package { "ipython-notebook":
    ensure => "installed",
    require  => Exec['apt-get update'],
}

package { "python-dev":
    ensure => "installed",
    require  => Exec['apt-get update'],
}

package { "xclip":
    ensure => "installed",
    require  => Exec['apt-get update'],
}

package { "git-core":
	ensure => "installed",
}
