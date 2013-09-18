class redis::install {

  package { 'redis':
    ensure => present,
    name   => $redis::local::packagename,
  }

}
