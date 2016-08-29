# Volume

In Hyper\_, volume offers high availability, durability, and consistent performance needed to run your workloads. It is a persistent storage service for use with containers.  Multiple replicas will be automatically created with each volume in the same region to protect your data from failure. 

Volume uses `EXT4` filesystem (more options in the future). Each container is shipped with a default `root volume` of 10GB. Additional volumes can be created separately with container:

    $ hyper volume create --size=100 --name=db_data
    db_data

New volumes can be created based on an existing snapshot. The new volume begins as an exact replica of the original snapshot (same size):

    $ hyper volume create --snapshot=mysnapshot --name=db_data
    db_data

To mount volumes to a container, use `hyper run`. 

    $ hyper run -v db_data:/opt/data/ --name mycontainer ubuntu
    mycontainer
    
You can also create volumes with `run`:

    $ hyper run -v /container/path --name mycontainer ubuntu                           	// a new blank volume (10GB) will be created and mounted onto `/container/path`
    mycontainer
    $ hyper run -v /local/path/:/container/path --name mycontainer ubuntu        		// a 10GB volume will be created and populated with data from /local/path
    mycontainer
    $ hyper run -v git://url[:branch]:/container/path --name mycontainer ubuntu		   	// a 10GB volume will be created and populated with data from git://url[:branch]
    mycontainer                                                           
    $ hyper run -v http://url.git[:branch]:/container/path --name mycontainer ubuntu 	// a 10GB volume will be created and populated with data from http://url.git[:branch]
    mycontainer                                                       
    $ hyper run -v http://url:/container/path --name mycontainer ubuntu    				// a 10GB volume will be created and populated with data from from http://url
    mycontainer
    
Once a volume is attached to a container, it will be associated with the container throughout the container's lifecycle, which means that when you (re)start the container, you don't need to mount the volume again. And it cannot be attached to a different container unless the first attaching container is removed.

However, when you `rm` a container, the attached volumes will be automatically unmounted. To remove the auto-created volumes along with a container:

    $ hyper rm -v db_container
    db_container

### Volume Failover

To failover a volume, you need to `stop` or `rm` the old container, and launch a new one to mount the volume.

    $ hyper rm db_contaienr
    db_container
    $ hyper run -v db_data:/opt/data --name new_db ubuntu
    new_db

Volumes are constrained by region. There is currently no way for containers to access volume residing in different regions.
