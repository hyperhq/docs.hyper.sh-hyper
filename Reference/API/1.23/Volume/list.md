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
          "Name": "tardis",
          "Driver": "cinder",
          "Mountpoint": "",
          "Labels": {
              "size": "10",
              "snapshot": ""
          }
        }
      ]
    }

Query Parameters:

- **filters** - JSON encoded value of the filters (a `map[string][]string`) to process on the volumes list. There is one available filter: `dangling=true`.

Status Codes:

-   **200** - no error
-   **500** - server error
