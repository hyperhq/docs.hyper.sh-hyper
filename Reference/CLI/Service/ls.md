## service ls

    Usage:	hyper service ls [OPTIONS]
    
    Lists services
    
    -f, --filter=[]    Filter output based on conditions provided
    --help             Print usage

Lists the services Hyper knows about.

### Examples

    $ hyper service ls
    Name         FIP    Containers                        Status              Message
    http                e71092036d68, 92b070136371        active              Scaling complete
    nginx               791095e7fb32, bc7bcc3b141d, ...   active              Scaling complete
