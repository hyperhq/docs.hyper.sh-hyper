# List volumes

`GET /volumes`

**Example request**:

    GET /volumes HTTP/1.1

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
      "Volumes": [
        {
          "Id": "tardis",
          "Name": "tardis",
          "Size": 10,
          "SnapshotId": "snapshot-3gkjo4z4"
        }
      ]
    }

Query Parameters:

- **filters** - JSON encoded value of the filters (a `map[string][]string`) to process on the volumes list. There is one available filter: `dangling=true`

Status Codes:

-   **200** - no error
-   **500** - server error
