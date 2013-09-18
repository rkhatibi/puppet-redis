class redis::config {

  File {
    owner => root,
    group => root,
    mode  => 0644,
  }

  file { '/etc/redis':
    ensure => directory,
    path   => $redis::local::configdir
  }

  file { 'redis.conf':
    ensure  => present,
    path    => $redis::local::configfile,
    content => template('redis/redis.conf.erb'),
  }
}
