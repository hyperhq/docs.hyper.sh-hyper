# Compose File Reference

The Compose file is a YAML file defining services, networks and volumes. The default path for a Compose file is ./docker-compose.yml.

A service definition contains configuration which will be applied to each container started for that service, much like passing command-line parameters to hyper run. Likewise, network and volume definitions are analogous to `hyper network create` and `hyper volume create`.

As with `hyper run`, options specified in the Docker Image(e.g., CMD, EXPOSE, VOLUME, ENV) are respected by default - you don’t need to specify them again in docker-compose.yml.

You can use environment variables in configuration values with a Bash-like ${VARIABLE} syntax - see variable substitution for full details.

## Service configuration reference
> Note: Hyper compose only supports two versions of the Compose file format – version 1 (the legacy format, which does not support volumes or networks) and version 2.

### command
Override the default command.
```
command: bundle exec thin -p 3000
```
The command can also be a list:
```
command: [bundle, exec, thin, -p, 3000]
```
### container_name
Specify a custom container name, rather than a generated default name.
```
container_name: my-web-container
```
Because Hyper container names must be unique, you cannot scale a service beyond 1 container if you have specified a custom name. Attempting to do so results in an error.

### depends_on
Express dependency between services, which has two effects:
* `compose up` will start services in dependency order. In the following example, db and redis will be started before web.
* `compose up SERVICE` will automatically include SERVICE’s dependencies. In the following example, `hyper compose up web` will also create and start db and redis.
Simple example:
```
version: '2'
services:
  web:
    image: wordpress
    depends_on:
      - db
  db:
    image: mysql
```

>Note: depends_on will not wait for db and redis to be “ready” before starting web - only until they have been started. If you need to wait for a service to be ready, see Controlling startup order for more on this problem and strategies for solving it.

### entrypoint
Override the default entrypoint.

```
entrypoint: /code/entrypoint.sh
```

The entrypoint can also be a list:

```
entrypoint:
    - php
    - -d
    - zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20100525/xdebug.so
    - -d
    - memory_limit=-1
    - vendor/bin/phpunit
```

### env_file

Add environment variables from a file. Only accept a list.
If you have specified a Compose file with `compose -f FILE`, paths in env_file are relative to the directory that file is in.
Environment variables specified in environment override these values.
```
env_file:
  - ./common.env
  - ./apps/web.env
  - /opt/secrets.env
```
Compose expects each line in an env file to be in VAR=VAL format. Lines beginning with `#` (i.e. comments) are ignored, as are blank lines.
```
# Set Rails/Rack environment
RACK_ENV=development
```
### environment
Add environment variables. You can use either an array or a dictionary. Any boolean values; true, false, yes no, need to be enclosed in quotes to ensure they are not converted to True or False by the YML parser.
Environment variables with only a key are resolved to their values on the machine Compose is running on, which can be helpful for secret or host-specific values.
```
environment:
  RACK_ENV: development
  SHOW: 'true'
  SESSION_SECRET:
environment:
  - RACK_ENV=development
  - SHOW=true
  - SESSION_SECRET
```
### extends
Extend another service, in the current file or another, optionally overriding configuration.
You can use extends on any service together with other configuration keys. The extends value must be a dictionary defined with a required service and an optional file key.
```
extends:
  file: common.yml
  service: webapp
```
The service the name of the service being extended, for example web or database. The file is the location of a Compose configuration file defining that service.
If you omit the file Compose looks for the service configuration in the current file. The file value can be an absolute or relative path. If you specify a relative path, Compose treats it as relative to the location of the current file.
You can extend a service that itself extends another. You can extend indefinitely. Compose does not support circular references and compose returns an error if it encounters one.

### external_links

Link to containers started outside this `docker-compose.yml` or even outside of Compose, especially for containers that provide shared or common services. `external_links` follow semantics similar to `links` when specifying both the container name and the link alias (`CONTAINER:ALIAS`).

```
external_links:
 - redis_1
 - project_db_1:mysql
 - project_db_1:postgresql
```

>Note: If you’re using the version 2 file format, the externally-created containers must be connected to at least one of the same networks as the service which is linking to them.

### image

Specify the image to start the container from. Can either be a repository/tag or a partial image ID.

```
image: redis
image: ubuntu:14.04
image: tutum/influxdb
image: example-registry.com:4000/postgresql
image: a4bc65fd
```

If the image does not exist, `Compose` attempts to pull it, unless you have also specified build, in which case it builds it using the specified options and tags it with the specified tag.

### labels

Add metadata to containers using Hyper labels. You can use either an array or a dictionary.
It’s recommended that you use reverse-DNS notation to prevent your labels from conflicting with those used by other software.

```
labels:
  com.example.description: "Accounting webapp"
  com.example.department: "Finance"
  com.example.label-with-empty-value: ""
labels:
  - "com.example.description=Accounting webapp"
  - "com.example.department=Finance"
  - "com.example.label-with-empty-value"
```

### links

Link to containers in another service. Either specify both the service name and a link alias (`SERVICE:ALIAS`), or just the service name.
```
web:
  links:
   - db
   - db:database
   - redis
```
Containers for the linked service will be reachable at a hostname identical to the alias, or the service name if no alias was specified.
Links also express dependency between services in the same way as depends_on, so they determine the order of service startup.

### volumes
Mount paths or named volumes. For version 2 files, named volumes can be specified with the top-level volumes key, a public http/https source file, or a public git repository. When using version 1, the Hyper will create the named volume automatically if it doesn’t exist.
```
volumes:
  # Just specify a path and let the Engine create a volume
  - /var/lib/mysql
  # Named volume, datavolume is volume name
  - datavolume:/var/lib/my
  # Named volume, https source
  - https://raw.githubusercontent.com/msanand/docker-workflow/master/node/Dockerfile:/data/Dockerfile
  # Named volume, git repository
  - https://github.com/hyperhq/hypercli.git:/data/hypercli
```

>Note: You can not specify local directory or files to init the volume like docker compose.

### fip
Attach an allocated floating IP to a (running) container, each container can have only one floating IP.  It will only accept a single string:

```
fip: 211.98.26.102
```

The reserved keyword `auto` tries to use free (existing) FIPs, before allocating more.

```
fip: auto
```
> Note: the `auto` keyword only works with Hyper CLI.

### size
The size for each container, it will only accept a single string.  Available size is s1, s2, s3, s4, m1, m2, m3, l1, l2 and l3.  For more details and price, you can refer the [doc](./../FAQ/pricing.md).

```
size: s4
```

### noauto_volume
This option tells Hyper service not to create new volumes for `VOLUME` sections in the container image. If not specified, compose will automatically create volumes for each `VOLUME` section in the container image.

```
noauto_volume: true
```

### security_groups
This option tells compose to add security groups to the container. A security group acts as a virtual firewall that controls the traffic for one or more containers.

```
security_groups:
  - sg-test-1
```

## Hyper compose vs Docker compose

<table class="table table-bordered table-striped table-condensed">
<tr>
<td></td>
<td>Docker</td>
<td>Hyper</td>
<td>Note</td>
</tr>
<tr>
<td>build</td>
<td>x</td></td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>cap_add</td>
<td>x</td>
<td>-</td>
<td>Add container capabilities.</td>
</tr>
<tr>
<td>cap_drop</td>
<td>x</td>
<td>-</td>
<td>Drop container capabilities.</td>
</tr>
<tr>
<td>command</td>
<td>x</td>
<td>x</td>
<td>Override the default command.</td>
</tr>
<tr>
<td>cgroup_parent</td>
<td>x</td>
<td>-</td>
<td>Specify an optional parent cgroup for the container.</td>
</tr>
<tr>
<td>container_name</td>
<td>x</td>
<td>x</td>
<td>Specify a custom container name, rather than a generated default name.</td>
</tr>
<tr>
<td>devices</td>
<td>x</td>
<td>-</td>
<td>List of device mappings.</td>
</tr>
<tr>
<td>depends_on</td>
<td>x</td>
<td>x</td>
<td>Express dependency between services.</td>
</tr>
<tr>
<td>dns</td>
<td>x</td>
<td>-</td>
<td>Custom DNS servers. Can be a single value or a list.</td>
</tr>
<tr>
<td>dns_search</td>
<td>x</td>
<td>-</td>
<td>Custom DNS search domains. Can be a single value or a list.</td>
</tr>
<tr>
<td>tmpfs</td>
<td>x</td>
<td>-</td>
<td>Mount a temporary file system inside the container. </td>
</tr>
<tr>
<td>entrypoint</td>
<td>x</td>
<td>x</td>
<td>Override the default entrypoint.</td>
</tr>
<tr>
<td>env_file</td>
<td>x</td>
<td>x</td>
<td>Add environment variables from a file. </td>
</tr>
<tr>
<td>environment</td>
<td>x</td>
<td>x</td>
<td>Add environment variables. </td>
</tr>
<tr>
<td>expose</td>
<td>x</td>
<td>x</td>
<td>Expose ports without publishing them to the host machine. (support later)</td>
</tr>
<tr>
<td>extends</td>
<td>x</td>
<td>x</td>
<td>Extend another service, in the current file or another, optionally overriding configuration.</td>
</tr>
<tr>
<td>external_links</td>
<td>x</td>
<td>x</td>
<td>Link to containers started outside this docker-compose.yml or even outside of Compose</td>
</tr>
<tr>
<td>extra_hosts</td>
<td>x</td>
<td>-</td>
<td>Add hostname mappings.</td>
</tr>
<tr>
<td>image</td>
<td>x</td>
<td>x</td>
<td>Specify the image to start the container from.</td>
</tr>
<tr>
<td>labels</td>
<td>x</td>
<td>x</td>
<td>Add metadata to containers using Docker labels.</td>
</tr>
<tr>
<td>links</td>
<td>x</td>
<td>x</td>
<td>Link to containers in another service. </td>
</tr>
<tr>
<td>logging</td>
<td>x</td>
<td>-</td>
<td>Logging configuration for the service.</td>
</tr>
<tr>
<td>log_driver</td>
<td>x</td>
<td>-</td>
<td>Specify a log driver.</td>
</tr>
<tr>
<td>log_opt</td>
<td>x</td>
<td>-</td>
<td>Specify logging options as key-value pairs.</td>
</tr>
<tr>
<td>net</td>
<td>x</td>
<td>-</td>
<td>[v1 only]network mode</td>
</tr>
<tr>
<td>network_mode</td>
<td>x</td>
<td>-</td>
<td>[v2 only]network mode</td>
</tr>
<tr>
<td>networks</td>
<td>x</td>
<td>-</td>
<td>[v2 only]Networks to join.</td>
</tr>
<tr>
<td>aliases</td>
<td>x</td>
<td>-</td>
<td>Aliases (alternative hostnames) for this service on the network.</td>
</tr>
<tr>
<td>ipv4_address</td>
<td>x</td>
<td>-</td>
<td>Specify a static IP address for containers for this service when joining the network.</td>
</tr>
<tr>
<td>ipv6_address</td>
<td>x</td>
<td>-</td>
<td>Specify a static IP address for containers for this service when joining the network.</td>
</tr>
<tr>
<td>pid</td>
<td>x</td>
<td>-</td>
<td>Sets the PID mode to the host PID mode.</td>
</tr>
<tr>
<td>ports</td>
<td>x</td>
<td>x</td>
<td>Expose ports.</td>
</tr>
<tr>
<td>security_opt</td>
<td>x</td>
<td>-</td>
<td>Override the default labeling scheme for each container.</td>
</tr>
<tr>
<td>stop_signal</td>
<td>x</td>
<td>x</td>
<td>Sets an alternative signal to stop the container.</td>
</tr>
<tr>
<td>ulimits</td>
<td>x</td>
<td>-</td>
<td>Override the default ulimits for a container. </td>
</tr>
<tr>
<td>volumes</td>
<td>x</td>
<td>x</td>
<td>Mount paths or named volumes.</td>
</tr>
<tr>
<td>volume_driver</td>
<td>x</td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>volume_from</td>
<td>x</td>
<td>-</td>
<td>Mount all of the volumes from another service or container</td>
</tr>
<tr>
<td>cpu_shares</td>
<td>x</td>
<td>-</td>
<td>cpu_shares: 73</td>
</tr>
<tr>
<td>cpu_quota</td>
<td>x</td>
<td>-</td>
<td>cpu_quota: 50000</td>
</tr>
<tr>
<td>cpuset</td>
<td>x</td>
<td>-</td>
<td>cpuset: 0,1</td>
</tr>
<tr>
<td>domainname</td>
<td>x</td>
<td>x</td>
<td>domainname: foo.com</td>
</tr>
<tr>
<td>hostname</td>
<td>x</td>
<td>x</td>
<td>hostname: boo</td>
</tr>
<tr>
<td>ipc</td>
<td>x</td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>mac_address</td>
<td>x</td>
<td>-</td>
<td>mac_address: 02:42:ac:11:65:43</td>
</tr>
<tr>
<td>mem_limit</td>
<td>x</td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>memswap_limit</td>
<td>x</td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>privileged</td>
<td>x</td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>read_only</td>
<td>x</td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>restart</td>
<td>x</td>
<td>x</td>
<td>restart: always</td>
</tr>
<tr>
<td>shm_size</td>
<td>x</td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>stdin_open</td>
<td>x</td>
<td>x</td>
<td></td>
</tr>
<tr>
<td>tty</td>
<td>x</td>
<td>x</td>
<td></td>
</tr>
<tr>
<td>user</td>
<td>x</td>
<td>-</td>
<td></td>
</tr>
<tr>
<td>working_dir</td>
<td>x</td>
<td>x</td>
<td></td>
</tr>
<tr>
<td>size</td>
<td>-</td>
<td>x</td>
<td>instance size of Hyper container</td>
</tr>
<tr>
<td>fip</td>
<td>-</td>
<td>x</td>
<td>floating IP</td>
</tr>
<tr>
<td>security_groups</td>
<td>-</td>
<td>x</td>
<td>Security Groups</td>
</tr>
<tr>
<td>noauto_volume</td>
<td>-</td>
<td>x</td>
<td>Do not auto create volume</td>
</tr>
<tr>
<td>networks</td>
<td>x</td>
<td>-</td>
<td></td>
</tr>
</table>
