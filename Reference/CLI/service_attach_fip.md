## service attach-fip

    Usage:	hyper service attach-fip [OPTIONS] SERVICE
    
    Attach a fip to the service
    
    --fip              Attach a fip to the service
    --help             Print usage

Attach a floating IP to the service.

### Examples

Attach an allocated floating IP to a service:

    $ hyper service attach-fip --fip=211.98.26.101 http
    http

Each service can have only one floating IP. Trying to attach another floating IP will return an error:

    $ hyper service attach-fip --fip=211.98.26.102 http
    Error response from daemon: Conflict, service(http) has attached with another floating IP(6.6.6.6).
