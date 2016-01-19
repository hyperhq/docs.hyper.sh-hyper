# Inspect

`GET /exec/(id)/json`

Return low-level information about the `exec` command `id`.

**Example request**:

    GET /exec/11fb006128e8ceb3942e7c58d77750f24210e35f879dd204ac975c184b820b39/json HTTP/1.1

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: plain/text

    {
      "ID" : "11fb006128e8ceb3942e7c58d77750f24210e35f879dd204ac975c184b820b39",
      "Running" : false,
      "ExitCode" : 2,
      "ProcessConfig" : {
        "privileged" : false,
        "user" : "",
        "tty" : false,
        "entrypoint" : "sh",
        "arguments" : [
          "-c",
          "exit 2"
        ]
      },
      "OpenStdin" : false,
      "OpenStderr" : false,
      "OpenStdout" : false,
      "Container" : {
        "State" : {
          "Status" : "running",
          "Running" : true,
          "Paused" : false,
          "Restarting" : false,
          "OOMKilled" : false,
          "Pid" : 3650,
          "ExitCode" : 0,
          "Error" : "",
          "StartedAt" : "2014-11-17T22:26:03.717657531Z",
          "FinishedAt" : "0001-01-01T00:00:00Z"
        },
        "ID" : "8f177a186b977fb451136e0fdf182abff5599a08b3c7f6ef0d36a55aaf89634c",
        "Created" : "2014-11-17T22:26:03.626304998Z",
        "Path" : "date",
        "Args" : [],
        "Config" : {
          "Hostname" : "8f177a186b97",
          "Domainname" : "",
          "User" : "",
          "AttachStdin" : false,
          "AttachStdout" : false,
          "AttachStderr" : false,
          "ExposedPorts" : null,
          "Tty" : false,
          "OpenStdin" : false,
          "StdinOnce" : false,
          "Env" : [ "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" ],
          "Cmd" : [
            "date"
          ],
          "Image" : "ubuntu",
          "Volumes" : null,
          "WorkingDir" : "",
          "Entrypoint" : null,
          "NetworkDisabled" : false,
          "MacAddress" : "",
          "OnBuild" : null,
          "SecurityOpt" : null
        },
        "Image" : "5506de2b643be1e6febbf3b8a240760c6843244c41e12aa2f60ccbb7153d17f5",
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": null,
            "SandboxKey": "",
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "",
            "Gateway": "",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "",
            "IPPrefixLen": 0,
            "IPv6Gateway": "",
            "MacAddress": "",
            "Networks": {
                "bridge": {
                    "NetworkID": "7ea29fc1412292a2d7bba362f9253545fecdfa8ce9a6e37dd10ba8bee7129812",
                    "EndpointID": "7587b82f0dada3656fda26588aee72630c6fab1536d36e394b2bfbcf898c971d",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:12:00:02"
                }
            }
        },
        "ResolvConfPath" : "/var/lib/docker/containers/8f177a186b977fb451136e0fdf182abff5599a08b3c7f6ef0d36a55aaf89634c/resolv.conf",
        "HostnamePath" : "/var/lib/docker/containers/8f177a186b977fb451136e0fdf182abff5599a08b3c7f6ef0d36a55aaf89634c/hostname",
        "HostsPath" : "/var/lib/docker/containers/8f177a186b977fb451136e0fdf182abff5599a08b3c7f6ef0d36a55aaf89634c/hosts",
        "LogPath": "/var/lib/docker/containers/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b/1eb5fabf5a03807136561b3c00adcd2992b535d624d5e18b6cdc6a6844d9767b-json.log",
        "Name" : "/test",
        "Driver" : "aufs",
        "ExecDriver" : "native-0.2",
        "MountLabel" : "",
        "ProcessLabel" : "",
        "AppArmorProfile" : "",
        "RestartCount" : 0,
        "Mounts" : []
      }
    }

Status Codes:

-   **200** – no error
-   **404** – no such exec instance
-   **500** - server error
