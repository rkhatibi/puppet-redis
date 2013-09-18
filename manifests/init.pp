class redis {

  include redis::local
  include redis::install, redis::config, redis::service
  Class['redis::install'] -> Class['redis::config'] ~> Class['redis::service']
}
