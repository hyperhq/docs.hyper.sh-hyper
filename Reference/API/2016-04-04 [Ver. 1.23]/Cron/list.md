# List crons

`GET /crons`

List all cron jobs

**Example request**:

```
GET /crons HTTP/1.1
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

[
    {
        "Name": "test-cron-job",
        "Schedule": "*/5 * * * *",
        "ContainerName": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [],
            "Cmd": [
                "ping",
                "-c",
                "3",
                "8.8.8.8"
            ],
            "Image": "busybox",
            "Volumes": {},
            "WorkingDir": "",
            "Entrypoint": [],
            "OnBuild": [],
            "Labels": {
                "sh_hyper_instancetype": "s4"
            },
            "StopSignal": "SIGTERM"
        },
        "HostConfig": {
            "Binds": [],
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "",
                "Config": {}
            },
            "NetworkMode": "bridge",
            "PortBindings": {},
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": [],
            "CapAdd": [],
            "CapDrop": [],
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": [],
            "GroupAdd": [],
            "IpcMode": "",
            "Cgroup": "",
            "Links": [],
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": [],
            "StorageOpt": {},
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 0,
            "ConsoleSize": [
                0,
                0
            ],
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": [],
            "BlkioDeviceWriteBps": [],
            "BlkioDeviceReadIOps": [],
            "BlkioDeviceWriteIOps": [],
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DiskQuota": 0,
            "KernelMemory": 0,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": null,
            "PidsLimit": 0,
            "Ulimits": [],
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0
        },
        "NetConfig": {
            "EndpointsConfig": {}
        },
        "Owner": "b8dc36865f4b480683dabb25598d61c4",
        "OwnerEmail": "",
        "OwnerEmail": "",
        "MailPolicy": "on-failure"
        "SuccessCount": 8,
        "ErrorCount": 0,
        "LastRun": "2016-11-11T11:50:04.579Z",
        "Created": "2016-11-11T11:47:14.129Z",
        "Disabled": false,
        "Tags": null
    },
    {
        "Name": "xxx",
        ...
    }
]
```

**Status Codes**:

* 200 – no error
* 500 – server error
