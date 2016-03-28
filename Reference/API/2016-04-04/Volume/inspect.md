# Inspect a volume

`GET /volumes/(name)`

Return low-level information on the volume `name`

**Example request**:

    GET /volumes/tardis

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
        "Id": "vol-gnj432se",
        "Name": "tardis",
        "Size": 10,
        "SnapshotId": "snapshot-3gkjo4z4"
    }

Status Codes:

-   **200** - no error
-   **404** - no such volume
-   **500** - server error