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
    port:     '6381'
    master:   'data01.sfo.example.com'
  prod_stats:
    port:     '6382'
    master:   'data02.sfo.example.com'
```
