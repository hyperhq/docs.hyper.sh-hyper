# Create a container

`POST /containers/create`

Create a container

**Example request**:

    POST /containers/create HTTP/1.1
    Content-Type: application/json

    {
           "Hostname": "",
           "Domainname": "",
           "User": "",
           "AttachStdin": false,
           "AttachStdout": true,
           "AttachStderr": true,
           "Tty": false,
           "OpenStdin": false,
           "StdinOnce": false,
           "Env": [
                   "FOO=bar",
                   "BAZ=quux"
           ],
           "Cmd": [
                   "date"
           ],
           "Entrypoint": "",
           "Image": "ubuntu",
           "Labels": {
                   "com.example.vendor": "Acme",
                   "com.example.license": "GPL",
                   "com.example.version": "1.0",
                   "sh_hyper_instancetype": "s4"
           },
           "Mounts": [],
           "WorkingDir": "",
           "NetworkDisabled": false,
           "MacAddress": "",
           "ExposedPorts": {
                   "22/tcp": {}
           },
           "StopSignal": "SIGTERM",
           "HostConfig": {
             "Binds": [],
             "Links": [],
             "Memory": 0,
             "MemorySwap": 0,
             "MemoryReservation": 0,
             "KernelMemory": 0,
             "CpuShares": 0,
             "CpuPeriod": 0,
             "CpuQuota": 0,
             "CpusetCpus": "",
             "CpusetMems": "",
             "BlkioWeight": 0,
             "BlkioWeightDevice": [],
             "BlkioDeviceReadBps": [],
             "BlkioDeviceReadIOps": [],
             "BlkioDeviceWriteBps": [],
             "BlkioDeviceWriteIOps": [],
             "MemorySwappiness": -1,
             "OomKillDisable": false,
             "OomScoreAdj": 0,
             "PortBindings": { "22/tcp": [{ "HostPort": "11022" }] },
             "PublishAllPorts": false,
             "Privileged": false,
             "ReadonlyRootfs": false,
             "Dns": [],
             "DnsOptions": [""],
             "DnsSearch": [""],
             "ExtraHosts": null,
             "VolumesFrom": [],
             "CapAdd": [],
             "CapDrop": [],
             "GroupAdd": [],
             "RestartPolicy": { "Name": "", "MaximumRetryCount": 0 },
             "NetworkMode": "bridge",
             "Devices": [],
             "Ulimits": [{}],
             "LogConfig": { "Type": "json-file", "Config": {} },
             "SecurityOpt": [""],
             "CgroupParent": "",
             "VolumeDriver": "",
             "ShmSize": 0 
          }
      }

**Example response**:

      HTTP/1.1 201 Created
      Content-Type: application/json

      {
           "Id":"6501525d12b5314538c520d6f0709d04296293507952d96b2dcc61e620313ef1",
           "Warnings":[]
      }

Json Parameters:

-   **Hostname** - A string value containing the hostname to use for the container.
-   `IGNORED` **Domainname** - A string value containing the domain name to use for the container.
-   `IGNORED` **User** - A string value specifying the user inside the container.
-   `IGNORED` **Memory** - Memory limit in bytes.
-   `IGNORED` **MemorySwap** - Total memory limit (memory + swap); set `-1` to disable swap
      You must use this with `memory` and make the swap value larger than `memory`.
-   `IGNORED` **MemoryReservation** - Memory soft limit in bytes.
-   `IGNORED` **KernelMemory** - Kernel memory limit in bytes.
-   `IGNORED` **CpuShares** - An integer value containing the container's CPU Shares
      (ie. the relative weight vs other containers).
-   `IGNORED` **CpuPeriod** - The length of a CPU period in microseconds.
-   `IGNORED` **CpuQuota** - Microseconds of CPU time that the container can get in a CPU period.
-   `IGNORED` **Cpuset** - Deprecated please don't use. Use `CpusetCpus` instead.
-   `IGNORED` **CpusetCpus** - String value containing the `cgroups CpusetCpus` to use.
-   `IGNORED` **CpusetMems** - Memory nodes (MEMs) in which to allow execution (0-3, 0,1). Only effective on NUMA systems.
-   `IGNORED` **BlkioWeight** - Block IO weight (relative weight) accepts a weight value between 10 and 1000.
-   `IGNORED` **BlkioWeightDevice** - Block IO weight (relative device weight) in the form of:        `"BlkioWeightDevice": [{"Path": "device_path", "Weight": weight}]`
-   `IGNORED` **BlkioDeviceReadBps** - Limit read rate (bytes per second) from a device in the form of:	`"BlkioDeviceReadBps": [{"Path": "device_path", "Rate": rate}]`, for example:
	`"BlkioDeviceReadBps": [{"Path": "/dev/sda", "Rate": "1024"}]"`
-   `IGNORED` **BlkioDeviceWriteBps** - Limit write rate (bytes per second) to a device in the form of:	`"BlkioDeviceWriteBps": [{"Path": "device_path", "Rate": rate}]`, for example:
	`"BlkioDeviceWriteBps": [{"Path": "/dev/sda", "Rate": "1024"}]"`
-   `IGNORED` **BlkioDeviceReadIOps** - Limit read rate (IO per second) from a device in the form of:	`"BlkioDeviceReadIOps": [{"Path": "device_path", "Rate": rate}]`, for example:
	`"BlkioDeviceReadIOps": [{"Path": "/dev/sda", "Rate": "1000"}]`
-   `IGNORED` **BlkioDeviceWiiteIOps** - Limit write rate (IO per second) to a device in the form of:	`"BlkioDeviceWriteIOps": [{"Path": "device_path", "Rate": rate}]`, for example:
	`"BlkioDeviceWriteIOps": [{"Path": "/dev/sda", "Rate": "1000"}]`
-   `IGNORED` **MemorySwappiness** - Tune a container's memory swappiness behavior. Accepts an integer between 0 and 100.
-   `IGNORED` **OomKillDisable** - Boolean value, whether to disable OOM Killer for the container or not.
-   `IGNORED` **OomScoreAdj** - An integer value containing the score given to the container in order to tune OOM killer preferences.
-   **AttachStdin** - Boolean value, attaches to `stdin`.
-   **AttachStdout** - Boolean value, attaches to `stdout`.
-   **AttachStderr** - Boolean value, attaches to `stderr`.
-   **Tty** - Boolean value, Attach standard streams to a `tty`, including `stdin` if it is not closed.
-   **OpenStdin** - Boolean value, opens stdin,
-   **StdinOnce** - Boolean value, close `stdin` after the 1 attached client disconnects.
-   **Env** - A list of environment variables in the form of `["VAR=value"[,"VAR2=value2"]]`
-   **Labels** - Adds a map of labels to a container. To specify a map: `{"key":"value"[,"key2":"value2"]}`
-   **Cmd** - Command to run specified as a string or an array of strings.
-   **Entrypoint** - Set the entry point for the container as a string or an array
      of strings.
-   **Image** - A string specifying the image name to use for the container.
-   **Mounts** - An array of mount points in the container.
-   **WorkingDir** - A string specifying the working directory for commands to
      run in.
-   `IGNORED` **NetworkDisabled** - Boolean value, when true disables networking for the
      container
-   **ExposedPorts** - An object mapping ports to an empty object in the form of:
      `"ExposedPorts": { "<port>/<tcp|udp>: {}" }`
-   `IGNORED` **StopSignal** - Signal to stop a container as a string or unsigned integer. `SIGTERM` by default.
-   **HostConfig**
    -   **Binds** – A list of volume bindings for this container. Each volume binding is a string in one of these forms:
           + `container_path` to create a new volume for the container
           + `host_path:container_path` to bind-mount a host path into the container
           + `host_path:container_path:ro` to make the bind-mount read-only inside the container.
           + `volume_name:container_path` to bind-mount a volume managed by a volume plugin into the container.
           + `volume_name:container_path:ro` to make the bind mount read-only inside the container.
    -   **Links** - A list of links for the container. Each link entry should be
          in the form of `container_name:alias`.
    -   **PortBindings** - A map of exposed container ports and the host port they
          should map to. A JSON object in the form
          `{ <port>/<protocol>: [{ "HostPort": "<port>" }] }`
          Take note that `port` is specified as a string and not an integer value.
    -   **PublishAllPorts** - Allocates a random host port for all of a container's
          exposed ports. Specified as a boolean value.
    -   `IGNORED` **Privileged** - Gives the container full access to the host. Specified as
          a boolean value.
    -   **ReadonlyRootfs** - Mount the container's root filesystem as read only.
          Specified as a boolean value.
    -   `IGNORED` **Dns** - A list of DNS servers for the container to use.
    -   `IGNORED` **DnsOptions** - A list of DNS options
    -   `IGNORED` **DnsSearch** - A list of DNS search domains
    -   `IGNORED` **ExtraHosts** - A list of hostnames/IP mappings to add to the
        container's `/etc/hosts` file. Specified in the form `["hostname:IP"]`.
    -   **VolumesFrom** - A list of volumes to inherit from another container.
          Specified in the form `<container name>[:<ro|rw>]`
    -   `IGNORED` **CapAdd** - A list of kernel capabilities to add to the container.
    -   `IGNORED` **Capdrop** - A list of kernel capabilities to drop from the container.
    -   `IGNORED` **GroupAdd** - A list of additional groups that the container process will run as
    -   **RestartPolicy** – The behavior to apply when the container exits.  The
            value is an object with a `Name` property of either `"always"` to
            always restart, `"unless-stopped"` to restart always except when
            user has manually stopped the container or `"on-failure"` to restart only when the container
            exit code is non-zero.  If `on-failure` is used, `MaximumRetryCount`
            controls the number of times to retry before giving up.
            The default is not to restart. (optional)
            An ever increasing delay (double the previous delay, starting at 100mS)
            is added before each restart to prevent flooding the server.
    -   **NetworkMode** - Sets the networking mode for the container. Supported
          values are: `bridge`, `host`, and `container:<name|id>`
    -   `IGNORED` **Devices** - A list of devices to add to the container specified as a JSON object in the
      form
          `{ "PathOnHost": "/dev/deviceName", "PathInContainer": "/dev/deviceName", "CgroupPermissions": "mrw"}`
    -   `IGNORED` **Ulimits** - A list of ulimits to set in the container, specified as
          `{ "Name": <name>, "Soft": <soft limit>, "Hard": <hard limit> }`, for example:
          `Ulimits: { "Name": "nofile", "Soft": 1024, "Hard": 2048 }`
    -   `IGNORED` **SecurityOpt**: A list of string values to customize labels for MLS
        systems, such as SELinux.
    -   **LogConfig** - Log configuration for the container, specified as a JSON object in the form
          `{ "Type": "<driver_name>", "Config": {"key1": "val1"}}`.
          Available types: `json-file`, `syslog`, `journald`, `gelf`, `awslogs`, `splunk`, `none`.
          `json-file` logging driver.
    -   `IGNORED` **CgroupParent** - Path to `cgroups` under which the container's `cgroup` is created. If the path is not absolute, the path is considered to be relative to the `cgroups` path of the init process. Cgroups are created if they do not already exist.
    -   **VolumeDriver** - Driver that this container users to mount volumes.
    -   `IGNORED` **ShmSize** - Size of `/dev/shm` in bytes. The size must be greater than 0.  If omitted the system uses 64MB.

Query Parameters:

-   **name** – Assign the specified name to the container. Must
    match `/?[a-zA-Z0-9_-]+`.

Status Codes:

-   **201** – no error
-   **404** – no such container
-   **406** – impossible to attach (container not running)
-   **500** – server error
