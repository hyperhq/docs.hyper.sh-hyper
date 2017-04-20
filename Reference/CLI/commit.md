## commit

    Usage: hyper commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]

    Create a new image from a container's changes

      -a, --author=""     Author (e.g., "John Hannibal Smith <hannibal@a-team.com>")
      -c, --change=[]     Apply specified Dockerfile instructions while committing the image
      --help              Print usage
      -m, --message=""    Commit message

It can be useful to commit a container's file changes or settings into a new
image. This allows you debug a container by running an interactive shell, or to
export a working dataset to another server. Generally, it is better to use
Dockerfiles to manage your images in a documented and maintainable way.

The commit operation will not include any data contained in
volumes mounted inside the container.

The `--change` option will apply `Dockerfile` instructions to the image that is
created.  Supported `Dockerfile` instructions:
`CMD`|`ENTRYPOINT`|`ENV`|`EXPOSE`|`LABEL`|`ONBUILD`|`USER`|`VOLUME`|`WORKDIR`

The commit operation only works on stopped container now.

### Examples

#### Commit a container

    $ hyper ps -a
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS                          PORTS
    50d6ab76a13a        busybox             "sh"                About a minute ago   Exited (0) 3 seconds ago

    $ hyper commit 50d6ab76a13a user/testimage:v1
    sha256:a0696d8da7b60abe14cb962156fee7c03cbcafd02e8b5ed8de679a5a1a5f768f

    $ hyper images
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    user/testimage      v1                  a0696d8da7b6        30 seconds ago      1.126 MB

#### Commit a container with new configurations

    $ hyper ps -a
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS                           PORTS
    50d6ab76a13a        busybox             "sh"                About a minute ago   Exited (0) 10 seconds ago

    $ hyper inspect -f "{{ .Config.Env }}" 50d6ab76a13a
    [PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin]

    $ hyper commit --change "ENV DEBUG true" 50d6ab76a13a  user/testimage:v2
    sha256:8a0cb365e21b94328e0fe8727ff347051e8bc0292fa8c5d1450a9b1d272bbaa4

    $ hyper inspect -f "{{ .Config.Env }}" 8a0cb365e21b
    [DEBUG=true PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin]

#### Commit a container with new `CMD` instruction

    $ hyper ps -a
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS                          PORTS
    50d6ab76a13a        busybox             "sh"                About a minute ago   Exited (0) About a minute ago

    $ hyper commit --change='CMD ["top"]' 50d6ab76a13a  user/testimage:v3
    sha256:ba79cd631395b20e415683f8a845bf89ef7b1d2237e609cead97e2a119f9e689

    $ hyper run -d user/testimage:v3
    9ad6e8b3e34e5e35c30f5c82548f5a47702803f8336cdb7db4e6cff6f637ee55

    $ hyper ps -a
    ID                  IMAGE                  COMMAND          CREATED             STATUS                           PORTS
    9ad6e8b3e34e        user/testimage:v3      "top"            39 seconds ago      Up 35 seconds
    50d6ab76a13a        busybox                "sh"             About a minute ago  Exited (0) About 3 minutes ago