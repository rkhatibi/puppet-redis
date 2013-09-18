class redis::service::disable inherits redis::service {

  Service['redis'] { ensure => stopped, enable => false, }

}
