# List Images

`GET /images/json`

**Example request**:

    GET /images/json?all=0 HTTP/1.1

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    [
      {
         "RepoTags": [
           "ubuntu:12.04",
           "ubuntu:precise",
           "ubuntu:latest"
         ],
         "Id": "8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c",
         "Created": 1365714795,
         "Size": 131506275,
         "VirtualSize": 131506275,
         "Labels": {}
      },
      {
         "RepoTags": [
           "ubuntu:12.10",
           "ubuntu:quantal"
         ],
         "ParentId": "27cf784147099545",
         "Id": "b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc",
         "Created": 1364102658,
         "Size": 24653,
         "VirtualSize": 180116135,
         "Labels": {
            "com.example.version": "v1"
         }
      }
    ]

**Example request, with digest information**:

    GET /images/json?digests=1 HTTP/1.1

**Example response, with digest information**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    [
      {
        "Created": 1420064636,
        "Id": "4986bf8c15363d1c5d15512d5266f8777bfba4974ac56e3270e7760f6f0a8125",
        "ParentId": "ea13149945cb6b1e746bf28032f02e9b5a793523481a0a18645fc77ad53c4ea2",
        "RepoDigests": [
          "localhost:5000/test/busybox@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf"
        ],
        "RepoTags": [
          "localhost:5000/test/busybox:latest",
          "playdate:latest"
        ],
        "Size": 0,
        "VirtualSize": 2429728,
        "Labels": {}
      }
    ]

The response shows a single image `Id` associated with two repositories
(`RepoTags`): `localhost:5000/test/busybox`: and `playdate`. A caller can use
either of the `RepoTags` values `localhost:5000/test/busybox:latest` or
`playdate:latest` to reference the image.

You can also use `RepoDigests` values to reference an image. In this response,
the array has only one reference and that is to the
`localhost:5000/test/busybox` repository; the `playdate` repository has no
digest. You can reference this digest using the value:
`localhost:5000/test/busybox@sha256:cbbf2f9a99b47fc460d...`

See the `docker run` and `docker build` commands for examples of digest and tag
references on the command line.

Query Parameters:

-   **all** – 1/True/true or 0/False/false, default false
-   **filters** – a JSON encoded value of the filters (a map[string][]string) to process on the images list. Available filters:
  -   `dangling=true`
  -   `label=key` or `label="key=value"` of an image label
-   **filter** - only return images with the specified name

### Build image from a Dockerfile

`POST /build`

Build an image from a Dockerfile

**Example request**:

    POST /build HTTP/1.1

    {{ TAR STREAM }}

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    {"stream": "Step 1..."}
    {"stream": "..."}
    {"error": "Error...", "errorDetail": {"code": 123, "message": "Error..."}}

The input stream must be a `tar` archive compressed with one of the
following algorithms: `identity` (no compression), `gzip`, `bzip2`, `xz`.

The archive must include a build instructions file, typically called
`Dockerfile` at the archive's root. The `dockerfile` parameter may be
used to specify a different build instructions file. To do this, its value must be
the path to the alternate build instructions file to use.

The archive may include any number of other files,
which are accessible in the build context (See the [*ADD build
command*](../../reference/builder.md#dockerbuilder)).

The build is canceled if the client drops the connection by quitting
or being killed.

Query Parameters:

-   **dockerfile** - Path within the build context to the Dockerfile. This is
        ignored if `remote` is specified and points to an individual filename.
-   **t** – A name and optional tag to apply to the image in the `name:tag` format.
        If you omit the `tag` the default `latest` value is assumed.
        You can provide one or more `t` parameters.
-   **remote** – A Git repository URI or HTTP/HTTPS URI build source. If the
        URI specifies a filename, the file's contents are placed into a file
		called `Dockerfile`.
-   **q** – Suppress verbose build output.
-   **nocache** – Do not use the cache when building the image.
-   **pull** - Attempt to pull the image even if an older image exists locally.
-   **rm** - Remove intermediate containers after a successful build (default behavior).
-   **forcerm** - Always remove intermediate containers (includes `rm`).
-   **memory** - Set memory limit for build.
-   **memswap** - Total memory (memory + swap), `-1` to disable swap.
-   **cpushares** - CPU shares (relative weight).
-   **cpusetcpus** - CPUs in which to allow execution (e.g., `0-3`, `0,1`).
-   **cpuperiod** - The length of a CPU period in microseconds.
-   **cpuquota** - Microseconds of CPU time that the container can get in a CPU period.
-   **buildargs** – JSON map of string pairs for build-time variables. Users pass
        these values at build-time. Docker uses the `buildargs` as the environment
        context for command(s) run via the Dockerfile's `RUN` instruction or for
        variable expansion in other Dockerfile instructions. This is not meant for
        passing secret values. [Read more about the buildargs instruction](../../reference/builder.md#arg)
-   **shmsize** - Size of `/dev/shm` in bytes. The size must be greater than 0.  If omitted the system uses 64MB.

    Request Headers:

-   **Content-type** – Set to `"application/tar"`.
-   **X-Registry-Config** – A base64-url-safe-encoded Registry Auth Config JSON
        object with the following structure:

            {
                "docker.example.com": {
                    "username": "janedoe",
                    "password": "hunter2"
                },
                "https://index.docker.io/v1/": {
                    "username": "mobydock",
                    "password": "conta1n3rize14"
                }
            }

        This object maps the hostname of a registry to an object containing the
        "username" and "password" for that registry. Multiple registries may
        be specified as the build may be based on an image requiring
        authentication to pull from any arbitrary registry. Only the registry
        domain name (and port if not the default "443") are required. However
        (for legacy reasons) the "official" Docker, Inc. hosted registry must
        be specified with both a "https://" prefix and a "/v1/" suffix even
        though Docker will prefer to use the v2 registry API.

Status Codes:

-   **200** – no error
-   **500** – server error