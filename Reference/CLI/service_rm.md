## service rm

    Usage:	hyper service rm [OPTIONS] service [service...]
    
    Remove one or more service
    
    --help             Print usage
    --keep             Keep the service container

Remove one or more services.

### Examples

**Remove a service and all associated containers:**

    $ hyper service rm http
    http

**Remove a service but leave containers running:**

    $ hyper service rm --keep https
    https

In this case, you need to remove the containers manually.
