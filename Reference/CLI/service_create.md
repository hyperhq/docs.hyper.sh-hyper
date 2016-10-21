## service create

    Usage:	hyper service create [OPTIONS] IMAGE
    
    Create a new service
    
    --algorithm=roundrobin       Algorithm of the service (e.g. roundrobin, leastconn, source)
    --container-port             Container port of the service, default same with service port
    -e, --env=[]                 Set environment variables
    --entrypoint                 Overwrite the default ENTRYPOINT of the image
    --env-file=[]                Read in a file of environment variables
    --health-check-fall=3        Number of consecutive valid health checks before considering the server as DOWN
    --health-check-interval=3    Interval in seconds for health checking the containers
    --health-check-rise=2        Number of consecutive valid health checks before considering the server as UP
    --help                       Print usage
    -i, --interactive            Keep STDIN open even if not attached
    -l, --label=[]               Set meta data on a container
    --label-file=[]              Read in a line delimited file of labels
    --name                       Service name
    --protocol=tcp               Protocol of the service (e.g. http, https, tcp, httpsTerm).
    --replicas=-1                Number of containers belonging to this service
    --service-port               Publish port of the service
    --session-affinity           Whether the service uses sticky sessions
    --sg=[]                      Security group for each container
    --size=s4                    The size of service containers (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3)
    --ssl-cert                   SSL cert file for httpsTerm service
    --stop-signal=SIGTERM        Signal to stop a container, SIGTERM by default
    -t, --tty                    Allocate a pseudo-TTY
    -v, ---volume=[]             Volume for each container
    -w, --workdir                Working directory inside the container

Creates a new service based on the image and options.

### Examples

**Create a http service:**

    $ hyper service create --service-port=80 --label=app=nginx --name=http --replicas=3 nginx
    http

**Create a https termination service:**

First gets a https certificate from certificate:

    $ certbot certonly --standalone -d yourdomain.com
    $ cat fullchain.pem privkey.pem > https-service.pem

Then create a service with protocol `httpsTerm`:

    $ hyper service create --service-port=443 --container-port=80 --label=app=nginx --name=https --replicas=3 --ssl-cert=https-service.pem --protocol=httpsTerm nginx
    https
