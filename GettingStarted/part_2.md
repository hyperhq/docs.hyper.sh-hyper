# Part 2 - Working with multiple containers

In part 1 we looked at starting, inspecting and interacting with a single container that had both an attached volume and a FIP to expose a port publicly. In this section we’ll look at how to work with multiple containers by using the perennial Wordpress example.

>**Note 1**
>Parts 2 and 3 require more resources than are available on the free trial, so now would be a good time to upgrade!

>**Note 2**
>If you’re familiar with Docker Compose, this will seem like a lot of manual work. Don’t worry, we’ll get to Hyper Compose in the next section!

## Starting MySQL
By now you’ll probably be able to guess the next steps, but let’s walk through them anyway.

```
$ hyper run --name mysqldb -e MYSQL_ROOT_PASSWORD=12345678 -d mysql
Unable to find image 'mysql:latest' in the current region
latest: Pulling from library/mysql
(Output cut to save space)
75a822cd7888: Pull complete 
Digest: sha256:de1570492c641112fdb94db9c788f6a400f71f25a920da95ec88c3848450ed57
Status: Downloaded newer image for mysql:latest
34856a35232f9044c93adaa4dd286b117412bf9580462d0e58a6c43055af9c81
```

Now let’s use `hyper ps` to check that the MySQL container is running:

```
$ hyper ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES               PUBLIC IP
34856a35232f        mysql               "docker-entrypoint.sh"   12 seconds ago      Up 4 seconds                            mysqldb             
```

All looks good. If you check `hyper volume ls` though, you’ll see something that you perhaps didn’t expect.

```
$ hyper volume ls
DRIVER              VOLUME NAME                                                       SIZE                CONTAINER
hyper               0492591e7602076e1240dbbcdead666945218049dfcd4f58e62dad4ce647c24   10 GB               34856a35232f
```

The hyper run command has automatically created and attached a 10GB Hyper Volume to the MySQL container.

As we mentioned before, Hyper Volumes are analogous to Amazon EBS mounts and allow you to decouple the lifetime of your data from the lifetime of the container. This is probably desirable for a database, but why did this happen without our explicit consent?

To answer is that we need to look at [the Dockerfile](https://github.com/docker-library/mysql/blob/4dd33136c4739667a223d39b6f829beb27b235cf/8.0/Dockerfile) that created the MySQL Docker image. The important line is below:

```
VOLUME /var/lib/mysql
```

When there is a `VOLUME` line in a Dockerfile, the Docker engine will automatically create a volume when the container is started. Hyper.sh mirrors this behaviour, but because you pay per-second with Hyper.sh, it’s always good to know what you’re paying for.

If you would like to disable this behaviour entirely you can always do that during the run command with the `--noauto-volume` flag, for example:

```
$ hyper run --name mysqldb -e MYSQL_ROOT_PASSWORD=12345678 --noauto-volume -d mysql
```

If you choose not to automatically create volumes all data will be written to the rootFS volume in the container that is deleted when your container is killed.

## Starting Wordpress

Next we’ll start the Wordpress container. The key point here is that the Wordpress container will need to find the MySQL container in order to connect to it. This is achieved via the `--link` flag for the `hyper run` command.

```
$ hyper run --name mywordpress --link mysqldb:mysql -p 8080:80 -d wordpress
```

If we now check the Wordpress container’s logs we will see that it is happily starting up:

```
$ hyper logs mywordpress
WordPress not found in /var/www/html - copying now...
Complete! WordPress has been successfully copied to /var/www/html
[Fri Dec 23 17:03:23.226477 2016] [mpm_prefork:notice] [pid 6] AH00163: Apache/2.4.10 (Debian) PHP/5.6.29 configured -- resuming normal operations
[Fri Dec 23 17:03:23.231231 2016] [core:notice] [pid 6] AH00094: Command line: 'apache2 -D FOREGROUND'
```

So what exactly did `--link` do? Well actually it does two things. Firstly it exposes the environments variables from the MySQL container to the Wordpress container as we can see using `hyper exec`:

```
$ hyper exec mywordpress env | grep -i mysql
MYSQL_PORT_3306_TCP_PROTO=tcp
MYSQL_ENV_MYSQL_MAJOR=5.7
MYSQL_PORT_3306_TCP=tcp://172.16.0.30:3306
MYSQL_ENV_MYSQL_ROOT_PASSWORD=12345678
MYSQL_PORT=tcp://172.16.0.30:3306
MYSQL_PORT_3306_TCP_ADDR=172.16.0.30
MYSQL_ENV_MYSQL_VERSION=5.7.17-1debian8
MYSQL_ENV_GOSU_VERSION=1.7
MYSQL_NAME=mysql
MYSQL_PORT_3306_TCP_PORT=3306
```

Secondly, `--link` creates an entry in the `/etc/hosts` file on the Wordpress container so that it can resolve the MySQL container’s IP address:

```
$ hyper exec mywordpress cat /etc/hosts | grep -i mysql
172.16.0.30	mysql
```

>**Note on linking containers**
>The whole reason why linking works in this case is because the MySQL container knows to look for certain environment variables at start up time. Although this is a common container pattern, make sure you check the startup scripts of any containers that you’re using to see what information they expect.

## Conclusion

You could now go ahead and connect your Wordpress container to an FIP and connect to it from the internet, but we already covered that in section 1 so that’s left up to you.

In this section we’ve seen how by using `--link` we can share environment variables and dns information between containers so that they can work together.

>**Final note**
>Don’t forget to clean up your resources from part 2!

In [Part 3](./part_3.html) we'll look at using Hyper Compose, which makes dealing with multiple containers much simpler.
