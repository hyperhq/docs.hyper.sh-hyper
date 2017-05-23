# Set a name for a floating IP

`POST /fips/name?ip=211.98.26.101&name=myweb`

**Example request**:

    POST /fips/name?ip=211.98.26.101&name=myweb HTTP/1.1

**Example response**:

```
HTTP/1.1 204 No Content
```

Status Codes:

-   **204** - no error
-   **404** - no such floating IP
-   **409** - conflict name
-   **500** - server error

