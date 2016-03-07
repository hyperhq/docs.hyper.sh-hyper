# Snapshot

Hyper_ allows you to take point-in-time snapshots of your volumes. Snapshots are incremental, which means that only the blocks that have changed after your most recent snapshot are saved. When a snapshot is deleted, only the data exclusive to that snapshot is removed. 

    $ hyper volume snapshot 

New volumes can be created based on an existing snapshot. The new volume begins as an exact replica of the original snapshot. When you create a volume from an existing snapshot, it loads lazily in the background so that you can begin using them right away. If you access a piece of data that hasn't been loaded yet, the volume immediately downloads the requested data from Amazon S3, and then continues loading the rest of the volume's data in the background. For more information, see Creating an Amazon EBS Snapshot.

Snapshots are constrained to the region in which they are created. You can create new volumes from existing snapshots in the same region.
