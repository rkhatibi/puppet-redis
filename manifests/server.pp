# We use ${port} for the resource declarations and ${name} for
# path so that it should be impossible to create conflicting
# servers using the same port and/or the same name
define redis::server (
  $port,
  $master='localhost',
  $master_port=$port
) {

  include redis::local

  File {
    owner => root,
    group => redis,
    mode  => '0640',
  }

  file { "redis_${port}.conf":
    ensure  => present,
    path    => "${redis::local::configdir}/redis_multi_${name}.conf",
    content => template('redis/redis_multi.conf.erb'),
    notify  => Service["redis-server-${port}"],
  }

  file { "redis_slave_${port}.conf":
    ensure  => present,
    path    => "${redis::local::configdir}/slave_multi_${name}.conf",
    content => template('redis/slave_multi.conf.erb'),
    notify  => Service["redis-server-${port}"],
  }

  file { "redis-server-${port}":
    ensure  => present,
    path    => "/etc/init.d/redis-server-${name}",
    content => template('redis/init_multi.erb'),
    notify  => Service["redis-server-${port}"],
    mode    => '0755',
  }

  service { "redis-server-${port}":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => $redis::local::hasstatus,
    name       => "redis-server-${name}",
  }

  Class['redis::service'] -> Redis::Server[$name]
}
