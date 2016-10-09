# Snapshot

Hyper.sh allows you to take point-in-time snapshots of your volumes. Snapshots are incremental, which means that only the blocks that have changed after your most recent snapshot are saved. When a snapshot is deleted, only the data exclusive to that snapshot is removed. 

    $ hyper snapshot create --volume myvol --name new_snapshot 
    new_snapshot is created

Snapshots are constrained to the region in which they are created. You can create new volumes from existing snapshots in the same region.The new volume begins as an exact replica of the original snapshot, e.g. cannot increase or shrink the size.