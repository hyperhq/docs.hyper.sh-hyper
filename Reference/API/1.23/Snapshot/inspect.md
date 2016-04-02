# Inspect a snapshot

`GET /snapshots/(name)`

Return low-level information on the snapshot `name`

**Example request**:

    GET /snapshots/tardis

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
        "Id": "snapshot-3gkjo4z4",
        "Name": "tardis",
        "Size": 10,
        "Volume": ""
    }

Status Codes:

-   **200** - no error
-   **404** - no such snapshot
-   **500** - server error
