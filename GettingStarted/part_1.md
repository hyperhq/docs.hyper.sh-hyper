# Part 1 - Starting and inspecting your first container

## Starting a container

First we’ll show you how to launch your first container and interact with it. Let’s start with a simple jenkins image that we will expose via a public IP.


```
$ hyper run -d --name myjenkins -v /var/jenkins_home -p 8080:8080 jenkins
Unable to find image 'jenkins:latest' in the current region
latest: Pulling from library/jenkins
(Output cut to save space)
Digest: sha256:5f595257805db3cb49f74fa3b6b2948134800d0bbe5a1c87e56e0573c8c3ba29
Status: Downloaded newer image for jenkins:latest

9c2c73118d7c370fbf59377cec5b2d7369c307acf32724404805e5b4d5f87749
```

If you’re familiar with Docker you’ll see that the commands and behaviour are identical. Hyper.sh found that the `jenkins` image was not available locally, pulled it and then started the container.

> **A note on container sizes**
The Hyper.sh CLI actually hid one argument from you during the hyper run command that’s worth mentioning. With Hyper.sh you can choose the size of your container using the `--size` flag. The default size for a container is ‘s4’ as you can see in the [hyper run documentation](https://docs.hyper.sh/Reference/CLI/run.html). You can see what the various sizes mean on the pricing page [here](https://hyper.sh/pricing.html).

Next we exposed port `8080` via the `-p 8080:8080` flag so that we can later attach our container to a public IP.

Lastly, we mounted a [Hyper Volume](https://docs.hyper.sh/Feature/storage/volume.html) at `/var/jenkins_home` which defaults to 10GB in size but can go up to 50GB. Hyper Volumes are analogous to Amazon EBS mounts in that they allow you to decouple the lifetime of your data from the lifetime of your container. You don’t need to worry about that now though, as we will cover volumes in more detail later on.

>**A note on volume types**
>You don’t _have_ to use extra volumes with your containers like we did in the example above. All containers are created with a fixed 10GB root file system volume that persists for the lifetime of the container. Extra volumes do situations like container upgrades and disaster recovery much simpler though.

## Exposing via a public IP

Now that the Jenkins container is running, we will connect it to a public IP address. First you need to create a new public IP address, which in Hyper.sh is called a floating IP (FIP).

```
$ hyper fip allocate 1
<YOUR NEW FIP>

$ hyper fip attach <YOUR NEW FIP> myjenkins
```

>**A note on FIP billing**
>Resources on Hyper.sh are billed per-second, _apart from_ FIPs which cost $1 per month from the point of allocation. This is to prevent abuse. To stop you accidentally spending too much money on FIPs you will be warned by the CLI if you attempt to allocate a new FIP when you have unused FIPs still available.

## Inspecting the container

Before we look at Jenkins itself, let’s take a look at some of the ways you can inspect your container. If you type `hyper ps` you can now see that the `jenkins` container is running, and is exposing port `8080` via the FIP you allocated earlier.

```
$ hyper ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES               PUBLIC IP
9c2c73118d7c        jenkins             "/bin/tini -- /usr/lo"   7 minutes ago       Up 7 minutes        0.0.0.0:8080->8080/tcp   myjenkins           209.177.87.106
```

Let’s look a little closer by using `hyper inspect`.

```
hyper inspect myjenkins
(Output cut to save space)
```

`hyper inspect` shows you information about your container, most of which is outside the scope of this section. You can see the container size however, which is useful for in case you cannot remember which size you started your containers as.

```
"Labels": {
                "sh.hyper.fip": "209.177.87.106",
                "sh_hyper_instancetype": "s4"
            },
```

`hyper logs` shows you any logging coming from your container:

```
$ hyper logs myjenkins
(Output cut to save space)
INFO: Jenkins is fully up and running
--> setting agent port for jnlp
--> setting agent port for jnlp... done
```

Lastly, `hyper stats` can be used to get `top`-like information from your running containers:

```
$ hyper stats myjenkins
CONTAINER           CPU %               MEM USAGE / LIMIT     MEM %               NET I/O             BLOCK I/O
myjenkins           1.11%               434.3 MB / 536.9 MB   80.90%              0 B / 0 B           117.4 MB / 4.08 MB
^C
```

## Interacting with the container

Now you can open a browser and navigate to `http://<YOUR FIP>:8080` where you’ll see the ‘Unlock Jenkins’ screen.

We can use `hyper exec` to run commands inside our container. Let’s use `hyper exec` find out our Jenkins `initialAdminPassword`.

```
$ hyper exec myjenkins cat /var/jenkins_home/secrets/initialAdminPassword
<Your initialAdminPassword>
```

You can now paste your `initialAdminPassword` into the browser in order to proceed. Configuring Jenkins is outside the scope of this guide, but you’ve now seen how to start a container, connect it to a public IP, inspect it and interact with it. Now we’ll clean everything up.


## Cleaning up

One of the key benefits of Hyper.sh is reducing your operations costs. To make sure that you’re not being billing for any resources that you’re not using, you should know how to clean up all resources once you are finished with them.

First you clean up the container:

```
$ hyper stop myjenkins
myjenkins
$ hyper rm myjenkins
myjenkins
NOTICE : attached volume(15df3e3368feed5443809dc91d398d1cb15549c024fe7358aecc217eae14c66) is not deleted
```

>**Note on rootFS billing**
>After running `hyper stop` you will still be billed for the rootFS volume. It is not deleted as you may later want to `hyper start` the container again. Only when you `hyper rm` the container will the container and rootFS volume be removed. Also, as with Docker, you can also perform both of the above commands in one go by using `hyper rm -f <containername or containerID>`.

Next let’s remove the the volume.

```
$ hyper volume ls
DRIVER              VOLUME NAME                                                       SIZE                CONTAINER
hyper               15df3e3368feed5443809dc91d398d1cb15549c024fe7358aecc217eae14c66   10 GB               
$ hyper volume rm 15df3e3368feed5443809dc91d398d1cb15549c024fe7358aecc217eae14c66
15df3e3368feed5443809dc91d398d1cb15549c024fe7358aecc217eae14c66
```

Lastly, you remove the image:

```
$ hyper images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
jenkins             latest              f61635651954        3 days ago          714.1 MB
$ hyper rmi jenkins
Untagged: jenkins:latest
Deleted: sha256:f61635651954adb853e95690b04dd3791e4fdbcfab7bfb66a2d505e31f3df31c
```

## How much did that cost?

In Hyper.sh, all resources are billed per-second apart from FIPs as mentioned above. With the above example there are 5 items that will be billed:

The container itself plus the rootFS disk in the container.
The attached Hyper Volume
The image used to create the container
The FIP

The billing for the example above would break down as follows.

**S4 size container:** $0.000002/second = $5.18/month

**10GB rootFS disk on s4 container:** $0.1/GB/month = $1/month

**10GB Hyper Volume:** $0.1/GB/month = $1/month

**Jenkins Docker image (714.1MB rounded up to 1GB):** 1GB@$0.0000000386/GB/second $0.1/GB/month = $0.1/month

**FIP:** $1/month

So the total monthly price for running a Jenkins container at s4 size with an attached volume and FIP is **$8.28**. You can always check your current usage costs in the [Hyper.sh console](https://console.hyper.sh/billing/credit).

>**Note on pricing**
>Remember that Hyper.sh allows you to choose the size of your container at start time so the billing information above applies to this example only. Check the pricing page for more information: [https://hyper.sh/pricing.html](https://hyper.sh/pricing.html)

That's it for part 1. In [Part 2](./part_2.html) we'll learn about working with multiple containers.
