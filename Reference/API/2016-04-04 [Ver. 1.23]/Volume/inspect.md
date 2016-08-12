# Inspect a volume

`GET /volumes/(name)`

Return low-level information on the volume `name`

**Example request**:

    GET /volumes/tardis

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
        "Name": "tardis",
        "Driver": "",
        "Mountpoint": "",
        "Labels": {
            "size": "10",
            "snapshot": ""
        }
    }

Status Codes:

-   **200** - no error
-   **404** - no such volume
-   **500** - server error
