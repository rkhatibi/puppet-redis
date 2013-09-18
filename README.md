puppet-redis
============

Puppet module to install Redis
Includes define to add multiple instances.

Only works on recent Ubuntu/Debian 

I would combine it with create resources and run it like this

```puppet
class profile::redis {

  include ::redis
  include ::redis::service::disable

  $myredis = hiera('redis::servers', {})
  create_resources('redis::server', $myredis)
}
```

```puppet
---
redis::servers:
  prod:
    port:        '6381'
    master:      'data01.sfo.example.com'
  prod_stats:
    port:        '6382'
    master:      'data02.sfo.example.com'
  stage_site:
    port:        '6482'
    master:      'data03.sfo.example.com'
    master_port: '6379'
  dev_test:
    port:         '6411'
```

The define checks master against $::clientcert and then decided
whether to configure it as a master or slave.

Would be nice to write a provider someday that modifies running
daemons rather than requiring a restart. 
