# Service

A Hyper_ Service is an abstraction which defines a logical set of containers and a policy by which to access them - sometimes called a micro-service. The set of containers targeted by a Service is determined by labels.

As an example, consider an image-processing backend which is running with 3 replicas. Those replicas are fungible - frontends do not care which backend they use. While the actual containers that compose the backend set may change, the frontend clients should not need to be aware of that or keep track of the list of backends themselves. The Service abstraction enables this decoupling.

Each service will receive an internal IP address which can only be accessed internal. For external accessing, a floating IP address need to be attached by `attach-fip` command.

### Examples

**Create a http service:**

    $ hyper service create --service-port=80 --label=app=nginx --image=nginx --replicas=3 http
    http

**Create a https termination service:**

First gets a https certificate from certificate:

    $ certificate certonly --standalone -d yourdomain.com
    $ cat fullchain.pem privkey.pem > cert.pem

Then create a service with protocol `httpsTerm`:

    $ hyper service create --service-port=443 --container-port=80 --label=app=nginx --image=nginx --replicas=3 --ssl-cert=cert.pem --protocol=httpsTerm https
    https

**List service:**

    $ hyper service ls
    Name         FIP    Containers                        Status              Message
    http                e71092036d68, 92b070136371        active              Scaling complete

**Attach an allocated floating IP to a service:**

    $ hyper service attach_fip --fip=6.6.6.6 http
    http

**Scale the service to more replicas:**

    $ hyper service scale http=8
    http

**Rolling update the service to new image:**

    $ hyper service rolling_update --image httpd http
    http
