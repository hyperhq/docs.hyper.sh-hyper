# List snapshots

`GET /snapshots`

**Example request**:

    GET /snapshots HTTP/1.1

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

- **filters** - JSON encoded value of the filters (a `map[string][]string`) to process on the snapshots list. There is one available filter: `dangling=true`

Status Codes:

-   **200** - no error
-   **500** - server error
