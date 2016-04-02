# Create a volume

`POST /volumes/create`

Create a volume

**Example request**:

    POST /volumes/create HTTP/1.1
    Content-Type: application/json

    {
      "Name": "tardis",
      "Driver": "cinder",
      "DriverOpts": {
          "size": "10",
          "snapshot":""
       }
    }

**Example response**:

    HTTP/1.1 201 Created
    Content-Type: application/json

    {
          "Name": "tardis",
          "Driver": "cinder",
          "Mountpoint": "",
          "Labels": {
              "size": "10",
              "snapshot": ""
          }
    }

Status Codes:

- **201** - no error
- **500**  - server error

JSON Parameters:

- **Name** - The new volume's name. If not specified, Docker generates a name.
- **Size** - The size of the new volume. The value must be integar with the unit of GB, and valid value is from 10-1000 (1TB).
- **SnapshotId** - The Id of the snapshot to restore.
