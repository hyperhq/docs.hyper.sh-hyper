# Mount a volume to a (stopped) container

`POST /containers/(id)/mount`

Mount a volume to a (stopped) container

**Example request**:

```
POST /containers/e90e34656806/mount HTTP/1.1
Content-Type: application/json

{
  "VolumeId": "vol-325dfk1z",
  "MountPoint": "/data/",
  "Permission": 0755
}
```

**Example response**:

    HTTP/1.1 201 OK

Status Codes:

- **201** - no error
- **404** - client request error
- **500** - Internal Server Error

JSON Parameters:

- **VolumeId** - the volume ID
- **MountPoint** - the path of the mount point
- **Permission** - the mount point path permission (non-recursive)
