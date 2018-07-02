# Part 3 - Hyper Compose

In part 2 we saw how to get containers to interact with each other in Hyper using the `--link` flag of the `hyper run` command. That works fine, but you have many containers working together it can be tedious to create and manage them using only the CLI. Docker solved this problem with Docker Compose, and Hyper Compose works in exactly the same way.

## Hyper Compose for a single container

Let’s start by using Hyper Compose to start the single container example that we saw in Part 1. As with Docker Compose, we need a compose file:

```
version: '2'
services:
  jenkins:
    image: jenkins
    size: s4
    ports:
      - "8080:8080"
    fip: <INSERT YOUR FIP HERE>
```

>**Note on the term ‘service’**
>You’ll notice in the Docker Compose format that each container is referred to as a ‘service:’. This is not the same as the Hyper Service functionality which is outside of the scope of this guide. You can read more about Hyper Service in the docs here: [https://docs.hyper.sh/Feature/container/service.html](https://docs.hyper.sh/Feature/container/service.html)

Above you can see that Hyper Compose and Docker Compose have pretty much the same format. In fact in most cases you can just run an existing Docker Compose file using Hyper Compose. The `size` and `FIP` fields are not present in Docker Compose, but as we’ve seen earlier in this guide, these are specific to Hyper.

Let’s save the compose file locally as `myfirstcompose.yml` and try it out. **Remember to insert your own FIP!**

```
hyper compose up -f myfirstcompose.yml
Project [markcoleman]: Starting project
[1/1] [jenkins]: Starting
[1/1] [jenkins]: Started
Project [markcoleman]: Project started
(Output cut to save space)
jenkins-1 | --> setting agent port for jnlp
jenkins-1 | --> setting agent port for jnlp... done
...
jenkins-1 | *************************************************************
jenkins-1 | *************************************************************
jenkins-1 | *************************************************************
jenkins-1 |
jenkins-1 | Jenkins initial setup is required. An admin user has been created and a password generated.
jenkins-1 | Please use the following password to proceed to installation:
jenkins-1 |
jenkins-1 | ad07e5fcddaf43d3963f1550d0ad4f68
jenkins-1 |
jenkins-1 | This may also be found at: /var/jenkins_home/secrets/initialAdminPassword
jenkins-1 |
jenkins-1 | *************************************************************
jenkins-1 | *************************************************************
jenkins-1 | *************************************************************
...
```

And that’s it. The Jenkins example that we looked at in Part 1 will now be up and running and accessible on `<YOUR FIP>:8080`

>**Note on changing compose files**
>If you want to make a change to your compose file, remember to first run `hyper compose down`, and then `hyper compose up` again to make sure that all changes are processed correctly.

Lastly, we’ll stop the container by using the `hyper compose down` command.

>**Note on external volumes with Hyper Compose**
>As you start to use Hyper Compose you’ll be able to get work much more quickly, but you’ll also be able to create lots of volumes. Make sure to use `hyper volume ls` afterwards to check which Hyper Volumes and lying around and `hyper volume rm` to remove those that you no longer need.

## Hyper Compose for multiple containers
Now that you’re familiar with Hyper Compose, let’s use the Wordpress example from Part 2 to look at a multi-container Hyper Compose example. Here’s the compose file:

```
version: '2'
services:
  mywordpress:
    image: wordpress:latest
    fip: <INSERT YOUR FIP HERE>
    links:
      - mysqldb:mysql
    depends_on:
      - mysqldb
    ports:
      - "8080:80"
  mysqldb:
    image: mysql:5.7
    environment:
        - MYSQL_ROOT_PASSWORD=12345678
```

As you can see, we have added two ‘services’ in this example, MySQL and Wordpress and the compose file parameters are exactly the same as those we used via the CLI in Part 2.

The `depends_on` field makes sure that the `mysqldb` service is started _before_ the Wordpress container. You can now save the above compose file locally and start the whole Wordpress application using the following command:

```
hyper compose up -f mywordpress_compose.yml
Project [markcoleman]: Starting project
[1/2] [mysqldb]: Starting
[1/2] [mysqldb]: Started
[2/2] [web]: Starting
[2/2] [web]: Started
Project [markcoleman]: Project started
(Output cut to save space)
```

And that’s it! You will now have your Wordpress application running and accessible publicly via your FIP.

>**Note on output from Hyper Compose**
>Most of the time you probably will not want to stream all output from Hyper Compose to standard err/out. To stop this you can add the `-d` flag to the `hyper compose up` command. You can then use `hyper logs` on the individual containers to see their output.

## Conclusion

In Part 3 we’ve looked at two examples of how to use Hyper Compose to manage more complex stacks. You can find the full documentation for Hyper Compose here: [https://docs.hyper.sh/Feature/container/compose.html](https://docs.hyper.sh/Feature/container/compose.html)

And for now, that's it. If you want to learn you're advised to look through the [documentation](https://docs.hyper.sh/) and the [blog](https://blog.hyper.sh/).

We wish you happy hacking on Hyper, but if you think that we've missed anything from the getting started guide **_please do_** tell us via the [Hyper console](https://console.hyper.sh/), [the forum](https://forum.hyper.sh/) or on [Twitter](https://twitter.com/hyper_sh).
