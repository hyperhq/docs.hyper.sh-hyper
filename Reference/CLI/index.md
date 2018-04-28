# CLI

```
Usage: hyper [OPTIONS] COMMAND [arg...]
       hyper [ --help | -v | --version ]

A self-sufficient runtime for containers.

Options:

  --config=~/.hyper       Location of client config files
  -D, --debug             Enable debug mode
  -h, --help              Print usage
  -l, --log-level=info    Set the logging level
  -R, --region            Set the region of hyper.sh
  -v, --version           Print version information and quit

Commands:
    attach    Attach to a running container
    commit    Create a new image from a container's changes
    compose   Define and run multi-container applications with Hyper.sh
    config    Config access key and secret key to Hyper server
    create    Create a new container
    cron      Manage cron service of Hyper.sh
    exec      Run a command in a running container
    fip       Manage Hyper.sh floating IPs
    func      Manage func service of Hyper.sh
    history   Show the history of an image
    images    List images
    info      Display system-wide information
    inspect   Return low-level information on a container or image
    kill      Kill a running container
    load      Load a local image or a tar file
    login     Register or log in to a Docker registry
    logout    Log out from a Docker registry
    logs      Fetch the logs of a container
    port      List port mappings or a specific mapping for the CONTAINER
    ps        List containers
    pull      Pull an image or a repository from a registry
    push      Push an image or a repository to a registry
    rename    Rename a container
    restart   Restart a container
    rm        Remove one or more containers
    rmi       Remove one or more images
    run       Run a command in a new container
    search    Search the Docker Hub for images
    service   Manage service of Hyper.sh
    sg        Manage security group of Hyper.sh
    snapshot  Manage Hyper.sh snapshots
    start     Start one or more stopped containers
    stats     Display a live stream of container(s) resource usage statistics
    stop      Stop a running container
    update    Update resources of one or more containers
    version   Show the Hyper.sh version information
    volume    Manage Hyper.sh volumes
    wait      Block until a container stops, then print its exit code

Run 'hyper COMMAND --help' for more information on a command.
```

Now, we have support for two [regions](../../Introduction/region.md)
- Los Angeles: us-west-1
- Frankfurt: eu-central-1

You may specify the region via the `--region` option when you want to manage the resources located in that specific region. The Los Angeles region will be the default region.

> NOTE: Options with the `IGNORED` mark are not supported currently and will be ignored.

- [attach](./attach.md)
- [commit](./commit.md)
- [create](./create.md)
- [exec](./exec.md)
- [images](./images.md)
- [info](./info.md)
- [inspect](./inspect.md)
- [kill](./kill.md)
- [load](./load.md)
- [login](./login.md)
- [logout](./logout.md)
- [logs](./logs.md)
- [port](./port.md)
- [ps](./ps.md)
- [pull](./pull.md)
- [push](./push.md)
- [rename](./rename.md)
- [restart](./restart.md)
- [rm](./rm.md)
- [rmi](./rmi.md)
- [run](./run.md)
- [start](./start.md)
- [stats](./stats.md)
- [stop](./stop.md)
- [update](./update.md)
- [version](./version.md)
- [search](./search.md)
- [volume](./Volume/index.md)
	- [create](./Volume/create.md)
	- [ls](./Volume/ls.md)
	- [rm](./Volume/rm.md)
- [snapshot](./Snapshot/index.md)
	- [create](./Snapshot/create.md)
	- [ls](./Snapshot/ls.md)
	- [rm](./Snapshot/rm.md)
- [fip](./FIP/index.md)
	- [allocate](./FIP/allocate.md)
	- [attach](./FIP/attach.md)
	- [detach](./FIP/detach.md)
	- [ls](./FIP/ls.md)
	- [release](./FIP/release.md)
	- [name](./FIP/name.md)
- [sg (security group)](./SG/index.md)
	- [create](./SG/create.md)
	- [ls](./SG/ls.md)
	- [inspect](./SG/inspect.md)
	- [rm](./SG/rm.md)
	- [update](./SG/update.md)
- [compose](./Compose/index.md)
	- [create](./Compose/create.md)
	- [down](./Compose/down.md)
	- [up](./Compose/up.md)
	- [rm](./Compose/rm.md)
	- [ps](./Compose/ps.md)
	- [run](./Compose/run.md)
	- [kill](./Compose/kill.md)
	- [start](./Compose/start.md)
	- [stop](./Compose/stop.md)
	- [scale](./Compose/scale.md)
- [service](./Service/index.md)
	- [create](./Service/create.md)
	- [ls](./Service/ls.md)
	- [inspect](./Service/inspect.md)
	- [scale](./Service/scale.md)
	- [rolling-update](./Service/rolling_update.md)
	- [attach-fip](./Service/attach_fip.md)
	- [detach-fip](./Service/detach_fip.md)
	- [rm](./Service/rm.md)
- [func](./Func/index.md)
	- [create](./Func/create.md)
	- [update](./Func/update.md)
	- [ls](./Func/ls.md)
	- [inspect](./Func/inspect.md)
	- [rm](./Func/rm.md)
	- [call](./Func/call.md)
	- [logs](./Func/logs.md)
	- [get](./Func/get.md)
