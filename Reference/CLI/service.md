## service

    Usage:	hyper service [OPTIONS] COMMAND [OPTIONS]
    
    Commands:
      create                   Create a service
      inspect                  Display detailed information on the given service
      ls                       List all services
      scale                    Scale the service
      rolling_update           Perform a rolling update of the given service
      attach_fip               Attach a fip to the service
      detach_fip               Detach the fip from the service
      rm                       Remove one or more services
    
    Run 'hyper service COMMAND --help' for more information on a command.
    
      --help             Print usage
    
      Run 'hyper service COMMAND --help' for more information on a command.

A Hyper_ service is an abstraction which defines a logical set of containers and a policy by which to access them - sometimes called a micro-service. The set of containers targeted by a service is determined by labels.

As an example, consider an image-processing backend which is running with 3 replicas. Those replicas are fungible - frontends do not care which backend they use. While the actual containers that compose the backend set may change, the frontend clients should not need to be aware of that or keep track of the list of backends themselves. The service abstraction enables this decoupling.

Each service will receive an internal IP address which can only be accessed internal. For external accessing, a floating IP address need to be attached by `attach_fip` command.