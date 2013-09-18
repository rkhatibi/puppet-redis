class redis::local {

# (Modify only to adapt to unsupported OSes)
  $packagename = $::osfamily ? {
    /(?i:debian)/ => 'redis-server',
    /(?i:redhat)/ => 'redis',
  }

  $servicename = $::osfamily ? {
    /(?i:debian)/ => 'redis-server',
    /(?i:redhat)/ => 'redis',
  }

  $processname = $::osfamily ? {
    /(?i:debian)/ => 'redis-server',
    /(?i:redhat)/ => 'redis',
  }

  $hasstatus = $::osfamily ? {
    default => true,
  }

  $configfile = $::osfamily ? {
    /(?i:debian)/ => '/etc/redis/redis.conf',
    /(?i:redhat)/ => '/etc/redis.conf',
  }

  $configdir = $::osfamily ? {
    default => '/etc/redis',
  }

}
