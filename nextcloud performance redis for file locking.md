NEXTCLOUD PERFORMANCE: how to quick install & configure redis for increased performance on file locking, for small appliances
src: https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/caching_configuration.html

assuming redis is on the same machine: using unix sockets instead of tcp listening
as recommended, you should let APCu handle the local cache
you can use redis for distributed caching, but it's out of scope


#install redis-server
$ apt install redis-server php-redis
#add redis to www-data user
$ usermod -a -G redis www-data


*in /etc/redis/redis.conf:
#disable TCP
port 0
#enable unix socket listening
unixsocket /run/redis/redis-server.sock
unixsocketperm 770

*in $nextcloud_dir/config/config.php:
'memcache.distributed' => '\OC\Memcache\Redis',
'memcache.locking' => '\OC\Memcache\Redis',
  'redis' => [
     'host'     => '/run/redis/redis-server.sock',
     'port'     => 0,
  ],

#restart your web server (assuming you are using apache)
$ systemctl restart apache2
