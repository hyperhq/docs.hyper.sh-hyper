# Create a volume

`POST /volumes/create`

Create a volume

**Example request**:

    POST /volumes/create HTTP/1.1
    Content-Type: application/json

    {
      "Name": "tardis"
    }

**Example response**:

    HTTP/1.1 201 Created
    Content-Type: application/json

    {
      "Name": "tardis",
      "Driver": "local",
      "Mountpoint": "/var/lib/docker/volumes/tardis"
    }

Status Codes:

- **201** - no error
- **500**  - server error

JSON Parameters:

- **Name** - The new volume's name. If not specified, Docker generates a name.
- **Driver** - Name of the volume driver to use. Defaults to `local` for the name.
- **DriverOpts** - A mapping of driver options and values. These options are
    passed directly to the driver and are driver specific.