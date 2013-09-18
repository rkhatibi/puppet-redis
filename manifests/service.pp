class redis::service {

  service { 'redis':
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => $redis::local::hasstatus,
      name       => $redis::local::servicename,
      pattern    => $redis::local::servicepattern,
  }

}
