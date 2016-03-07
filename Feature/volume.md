# Volume

`Volume` is a persistent storage service for use with containers in the Hyper_ cloud.  Multiple replicas will be automatically created with each volume in the same region to protect your data from hardware failure. In Hyper_, volume offers high availability, durability, and consistent performance needed to run your workloads. 

In Hyper_, volume uses `EXt4` filesystem (more options in the future). Each container is shipped with a default `root volume` of 10GB. Additional volumes can be created separately with container, with the size range of `10GB` to `1TB`:

    $ hyper volume_create 100 -n db_data

To mount volumes to a container, use `hyper run`. 

    $ hyper run ubuntu -v db_data:/opt/data/
    
You can also create volumes implicitly:

    $ hyper run ubuntu -v /opt/data/           // a 10GB volume will be created
    
Once a volume is attached to a container, it will be associated with the container throughout the container's lifecycle, until removal:

    $ hyper rm db_container
    
You can also remove the attached volumes along with a container:

    $ hyper rm -v db_container

### Volume Failover

To failover volume, you need to `rm` the old container, and launch a new one to mount the volumes.

    $ hyper rm db_contaienr
    $ hyper run ubuntu -v db_data:/opt/data new_db
