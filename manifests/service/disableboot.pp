class redis::service::disableboot inherits redis::service {

  Service['redis'] { enable => false, }

}
