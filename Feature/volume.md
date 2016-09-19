# Volume

In Hyper\_, volume offers high availability, durability, and consistent performance needed to run your workloads. It is a persistent storage service for use with containers.  Multiple replicas will be automatically created with each volume in the same region to protect your data from failure. 

Volume uses `EXT4` filesystem (more options in the future). Each container is shipped with a default `root volume` of 10GB. Additional volumes can be created separately with container:

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
