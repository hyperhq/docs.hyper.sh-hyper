# Unmount a volume from a (stopped) container

`POST /containers/(id)/umount`

Unmount a volume from a (stopped) container

**Example request**:

```
POST /containers/e90e34656806/umount HTTP/1.1
Content-Type: application/json

{
  "VolumeId": "vol-325dfk1z"
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
