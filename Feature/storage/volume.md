# Volume

In Hyper.sh, volumes offer high availability, durability, and consistent performance needed to run your workloads. It is a persistent storage service for use with containers.  Multiple replicas will be automatically created with each volume in the same region to protect your data from failure. 

Volume uses `EXT4` filesystem (more options in the future). Each container is shipped with a default `root volume` of 10GB. Additional volumes can be created separately with a container:

    $ hyper volume create --size=10 --name=dbdata
    dbdata

New volumes can be created based on an existing snapshot. The new volume begins as an exact replica of the original snapshot (same size):

    $ hyper volume create --snapshot=mysnapshot --name=dbdata
    dbdata

To mount volumes to a container, use `hyper run`.

    $ hyper run -v dbdata:/opt/data/ --name mycontainer ubuntu
    mycontainer

You can also mount the same volume to different mountpoints of the same container.

    $ hyper run -v vol1:/opt/data -v vol1:/opt/log --name=mycontainer ubuntu
    mycontainer

You can also create volumes with `run`:

    # new blank volume (10GB) will be created and mounted onto `/container/path`
    $ hyper run -v /container/path --name mycontainer ubuntu
    mycontainer

    # 10GB volume will be created and populated with data from /local/path
    $ hyper run -v /local/path/:/container/path --name mycontainer ubuntu
    mycontainer

    # 10GB volume will be created and populated with data from git://url[:branch]
    $ hyper run -v git://url[:branch]:/container/path --name mycontainer ubuntu
    mycontainer                                                           

    # 10GB volume will be created and populated with data from http://url.git[:branch]
    $ hyper run -v http://url.git[:branch]:/container/path --name mycontainer ubuntu
    mycontainer                                                       

    # 10GB volume will be created and populated with data from from http://url
    $ hyper run -v http://url:/container/path --name mycontainer ubuntu
    mycontainer


### Volume size

A volume can be create in sizes between 10 and 50 GB.

### Volume lifecycle

Once a volume is attached to a container, it will be associated with the container throughout the container's lifecycle, which means that when you (re)start the container, you don't need to mount the volume again. And it cannot be attached to a different container unless the first attaching container is removed.

However, when you `rm` a container, the attached volumes will be automatically unmounted. To remove the auto-created volumes along with a container:

    $ hyper rm -v db_container
    db_container

### Volume Failover

To failover a volume, you need to `stop` or `rm` the old container, and launch a new one to mount the volume.

    $ hyper rm db_contaienr
    db_container
    $ hyper run -v dbdata:/opt/data --name new_db ubuntu
    new_db

Volumes are constrained by region. There is currently no way for containers to access volume residing in different regions.

### Volume Reuse

Notes on reusing existing volumes: users should pay attention to volume access permissions. For example, if a volume is first mounted in container `foo` and then reused in container `bar`, file/directory permissions in the volume will keep the same as being set in container `foo`. As a result, a change of container users (uid/gid pair) may have impacts on volume contents access rights.

### Image Volume Creation

New volumes will be created automatically if `VOLUME` section is present in the container image.

    $ hyper run --name mycontainer hyperhq/noauto_volume_test
    mycontainer
    $ hyper volume ls
    DRIVER              VOLUME NAME                                                       SIZE                CONTAINER
    hyper               d358e606246ce22c9d528913f6990c45cd8ddbb7df7d8e1110d3c66b0cbf734   10 GB               1b617eb3ab0f
    hyper               805ef123f4e60b048448784a4aa56d13469fb4aa42ae0e1fcd006c2b7b1e807   10 GB               1b617eb3ab0f

You can avoid this by specifying the `--noauto-volume` option.

    $ hyper run --name mycontainer --noauto-volume hyperhq/noauto_volume_test

### File Volume Initialization

When initializing a volume with a specified source (local or http) that points to a file, the volume destination must also be a file. The destination file will be created automatically if it does not already exist.

However, if the image itself has a directory at the volume destination place, the container will fail to start. For example, the following command will fail to start the container, because `/etc/hosts` is a file source and `/mnt` is an existing directory in container image `ubuntu:14.04`. The same applies to http/https based remote volume sources as well.

    $ hyper run -d -v /etc/hosts:/mnt ubuntu:14.04

Instead, you can avoid the failure by specifying a non-directory place to mount the source file, e.g.:

    $ hyper run -d -v /etc/hosts:/mnt/hosts ubuntu:14.04

### Shared Volumes

Shared volumes are provided using the `--volumes-from` option.

You need to create a container using `hyperhq/nfs-server` image. It runs an optimized [nfs-ganesha](https://github.com/nfs-ganesha/nfs-ganesha) server and automatically exports all attached volumes via NFS protocol. Once ready, you can mount the exposed volumes in other containers using the `--volumes-from` option.

For example,the following commands expose two volumes (`/data1` and `/data2`), and mount them in two `busybox` containers (`test1` and `test2`). `test1` and `test2` will each have these two volumes mounted at the path `/data` and `/data2`.

    $ hyper run --name mycontainer -d -v /data1 -v /data2 hyperhq/nfs-server
    $ hyper run -d --name test1 --volumes-from mycontainer busybox
    $ hyper run -d --name test2 --volumes-from mycontainer busybox

> NOTE: Recursive mounting is not allowed, e.g. you cannot re-mount the NFS volumes from containers `test1` and `test2` to a third one `test3`:

    $ hyper run -d --name test3 --volumes-from test1 busybox
    hyper: Error response from daemon: Cannot recursively import volumes from test1.
    See 'hyper run --help'.

> NOTE: `--volumes-from` source container must be created with the Hyper official image (`hyperhq/nfs-server`). Trying to import volumes from containers of other images will fail, e.g.,

    $ hyper run -d --name foo busybox
    $ hyper run -d --volumes-from foo busybox
    hyper: Error response from daemon: volumes-from source container is created from busybox rather than the official image hyperhq/nfs-server.
    See 'hyper run --help'.
