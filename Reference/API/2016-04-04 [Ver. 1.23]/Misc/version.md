# Show Hyper API version information

`GET /version`

Show Hyper API version information

**Example request**:

    GET /version HTTP/1.1

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
         "Version": "1.10.0-dev",
         "Os": "linux",
         "KernelVersion": "3.19.0-23-generic",
         "GoVersion": "go1.4.2",
         "GitCommit": "e75da4b",
         "Arch": "amd64",
         "ApiVersion": "1.23",
         "BuildTime": "2015-12-01T07:09:13.444803460+00:00",
         "Experimental": true
    }

Status Codes:

-   **200** – no error
-   **500** – server error
