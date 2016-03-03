# List floating IPs

`GET /fips`

**Example request**:

    GET /fips?filters={"dangling":true}} HTTP/1.1

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "FIP": "8.8.8.8",
    "ContainerId": "e90e34656806",
    "AllocatedFrom": "1453270862574",
    "Tags": {
    	"prod": ""
    }
  },
  {
    "FIP": "8.8.8.8",
    "AllocatedFrom": "1453270862174",
  }
]
```

Status Codes:

-   **200** - no error
-   **500** - server error
