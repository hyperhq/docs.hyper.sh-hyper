# Get container logs

`GET /containers/(id)/logs`

Get `stdout` and `stderr` logs from the container ``id``

> **Note**:
> This endpoint works only for containers with the `json-file` or `journald` logging drivers.

**Example request**:

     GET /containers/4fa6e0f0c678/logs?stderr=1&stdout=1&timestamps=1&follow=1&tail=10&since=1428990821 HTTP/1.1

**Example response**:

     HTTP/1.1 101 UPGRADED
     Content-Type: application/vnd.docker.raw-stream
     Connection: Upgrade
     Upgrade: tcp

     {{ STREAM }}

Query Parameters:

-   **follow** – 1/True/true or 0/False/false, return stream. Default `false`.
-   **stdout** – 1/True/true or 0/False/false, show `stdout` log. Default `false`.
-   **stderr** – 1/True/true or 0/False/false, show `stderr` log. Default `false`.
-   **since** – UNIX timestamp (integer) to filter logs. Specifying a timestamp
    will only output log-entries since that timestamp. Default: 0 (unfiltered)
-   **timestamps** – 1/True/true or 0/False/false, print timestamps for
        every log line. Default `false`.
-   **tail** – Output specified number of lines at the end of logs: `all` or `<number>`. Default all.

Status Codes:

-   **101** – no error, hints proxy about hijacking
-   **200** – no error, no upgrade header found
-   **404** – no such container
-   **500** – server error