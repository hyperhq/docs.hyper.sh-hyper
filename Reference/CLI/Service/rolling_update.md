## service rolling-update

    Usage:	hyper service rolling-update [OPTIONS] SERVICE [SERVICE...]
    
    Perform a rolling update of the given service
    
    --help             Print usage
    --image            New container image

Replaces the specified service with a new one by updating one container at a time to use the
new image.

### Examples

    $ hyper service rolling-update --image httpd http
    http
