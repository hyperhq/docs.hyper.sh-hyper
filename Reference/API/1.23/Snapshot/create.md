# Create a snapshot

`POST /snapshots/create`

**Example request**:

    POST /snapshots/create?name=snapshot-tardis&volume=tardis HTTP/1.1

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
      "Snapshots": [
        {
          "Id": "snapshot-tardis",
          "Name": "snapshot-tardis",
          "Size": 10,
          "Volume": "tardis"
        }
      ]
    }

Query Parameters:

- **name** - Snapshot's name
- **volume** - Snapshot's volume

Status Codes:

-   **200** - no error
-   **404** - no such volume
-   **500** - server error
