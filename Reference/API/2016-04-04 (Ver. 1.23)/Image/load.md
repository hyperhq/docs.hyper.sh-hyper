# Load image from archive

`POST /images/load`

Load a set of images from a remote archive file compressed with gzip, bzip, or xz.

**Example request**:

    POST /images/load HTTP/1.1
    Content-Type: application/json
    {
      "fromSrc":"https://<bucket>.s3.amazonaws.com/public/busybox_alpine.tar.gz",
      "quiet":false
    }

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json
    {"status":"Loading layer...}
    {"status":"Loading layer","progressDetail":{"current":1024,"total":1024},"progress":"[====..."}
    {"status":"...:latest(sha256:94df4f0ce8a4d4d4c030b9bdfe91fc9cf6a4b7be914542315ef93a046d520614) has been loaded."}

Status Codes:

-   **200** – no error
-   **500** – server error
