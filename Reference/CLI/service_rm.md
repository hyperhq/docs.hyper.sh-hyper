## service rm

    Usage:	hyper service rm [OPTIONS] service [service...]
    
    Remove one or more services
    
    --help             Print usage
    --keep             Keep the service container

Remove one or more services.

### Examples

**Remove a service and all backend containers belonging to it:**

    $ hyper service rm http
    http

**Remove a service but keep backend containers running:**

    $ hyper service rm --keep http
    service1

This will only remove the service, and all backend containers are not removed. You may need remove them manually by container ID.
