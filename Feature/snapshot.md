# Snapshot

Hyper_ allows you to take point-in-time snapshots of your volumes. Snapshots are incremental, which means that only the blocks that have changed after your most recent snapshot are saved. When a snapshot is deleted, only the data exclusive to that snapshot is removed. 

    $ hyper volume snapshot --name new_snapshot vol-2skg12da
    new_snapshot is created

New volumes can be created based on an existing snapshot. The new volume begins as an exact replica of the original snapshot.

Snapshots are constrained to the region in which they are created. You can create new volumes from existing snapshots in the same region.
