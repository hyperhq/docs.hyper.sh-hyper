# Volume

In Hyper\_, volume offers high availability, durability, and consistent performance needed to run your workloads. It is a persistent storage service for use with containers.  Multiple replicas will be automatically created with each volume in the same region to protect your data from failure. 

Volume uses `EXT4` filesystem (more options in the future). Each container is shipped with a default `root volume` of 10GB. Additional volumes can be created separately with container:

    $ hyper volume create --size=100 --name=db_data
    db_data

New volumes can be created based on an existing snapshot. The new volume begins as an exact replica of the original snapshot (same size):

    $ hyper volume create --snapshot=snapshot-2ixknb3z --name=db_data
    db_data

To mount volumes to a container, use `hyper run`. 

    $ hyper run -v db_data:/opt/data/ --name mycontainer ubuntu
    mycontainer
    
You can also create volumes with `run`:

    $ hyper run -v /opt/data/ --name mycontainer ubuntu         // a 10GB volume will be created
    mycontainer
    
Once a volume is attached to a container, it will be associated with the container throughout the container's lifecycle, until removal:

    $ hyper rm db_container
    db_container
    
You may also remove the attached volumes along with a container:

    $ hyper rm -v db_container
    db_container

### Volume Failover

To failover a volume, you need to `rm` the old container, and launch a new one to mount the volume.

    $ hyper rm db_contaienr
    db_container
    $ hyper run -v db_data:/opt/data --name new_db ubuntu
    new_db

Volumes are constrained by region. There is currently no way for containers to access volume residing in different regions.