# Service

In Hyper.sh, a `Service` is an abstraction which defines a logical set of containers in a single (private) network and a policy by which to access them. The set of containers targeted by a Service is determined by labels.

As an example, consider an image-processing backend which is running with 3 replicas. Those replicas are fungible - frontends do not care which backend they use. While the actual containers that compose the backend set may change, the frontend clients should not need to be aware of that or keep track of the list of backends themselves. The Service abstraction enables this decoupling.

Every service will receive an internal IP address which can only be accessed within the network where the service resides. For public access, a floating IP address needs to be attached by `attach-fip` command.

Currently, service supports four different protocols:

- `tcp`        tcp traffic ---> service ---tcp---> containers
- `http`       http traffic ---> service ---http---> containers
- `https`      https traffic ---> service ---https---> containers
- `httpsTerm`  https traffic ---> service ---http---> containers

### Examples

**Create a HTTP service:**

    $ hyper service create --service-port=80 --label=app=nginx --name=http --replicas=3 nginx
    http

**Create a HTTPS termination service:**

First gets a https certificate from certificate:

    $ certbot certonly --standalone -d yourdomain.com
    $ cat fullchain.pem privkey.pem > https-service.pem

Then create a service with protocol `httpsTerm`:

    $ hyper service create --service-port=443 --container-port=80 --label=app=nginx --name=https --replicas=3 --ssl-cert=https-service.pem --protocol=httpsTerm nginx
    https

**List service:**

    $ hyper service ls
    Name         FIP    Containers                        Status              Message
    http                e71092036d68, 92b070136371        active              Scaling complete

**Attach an allocated floating IP to a service:**

    $ hyper service attach-fip --fip=6.6.6.6 http
    http

**Scale the service to more replicas:**

    $ hyper service scale http=8
    http

**Rolling update the service to new image:**

    $ hyper service rolling-update --image httpd http
    http
