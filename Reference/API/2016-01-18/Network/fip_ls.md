# List floating IPs

`GET /fips`

**Example request**:

    GET /fips HTTP/1.1

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "container": "",
    "fip": "8.8.4.4"
  },
  {
    "container": "aa733d1782c92f295ff7291817b92c37938274b5e9fc3f4202c13f2db246192b",
    "fip": "8.8.8.8"
  }
]
```

Query Parameters:

- **filters** - JSON encoded value of the filters (a `map[string][]string`) to process on the fip list.  There is one available filter: `dangling=true`

Status Codes:

-   **200** - no error
-   **500** - server error
