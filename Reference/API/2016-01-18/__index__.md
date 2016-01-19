# Version 2016-01-18

 - The Remote API has replaced `rcli`.
 - The daemon listens on `unix:///var/run/docker.sock` but you can
   [Bind Docker to another host/port or a Unix socket](../../userguide/basics.md#bind-docker-to-another-host-port-or-a-unix-socket).
 - The API tends to be REST. However, for some complex commands, like `attach`
   or `pull`, the HTTP connection is hijacked to transport `stdout`,
   `stdin` and `stderr`.
 - When the client API version is newer than the daemon's, these calls return an HTTP
   `400 Bad Request` error message.

