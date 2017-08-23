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
        "Driver": "hyper",
        "Mountpoint": "",
        "Labels": {
            "container": "",
            "size": "10",
            "snapshot": ""
        },
        "CreatedAt": "2017-03-28T13:37:43.744Z"
    }

Status Codes:

-   **200** - no error
-   **404** - no such volume
-   **500** - server error
