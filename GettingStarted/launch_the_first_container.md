# Launch the first container

### 1. Pull the image

The first step is to pull the image. However, instead of downloading to your local laptop, `hyper pull` will pull the image to your account at Hyper.sh.

Open your terminal and enter:

    $ hyper pull nginx

Once the download completes, you can see images with:

	$ hyper images
	REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    busybox             latest              47bcc53f74dc        2 weeks ago         1.113 MB
    busybox             uclibc              47bcc53f74dc        2 weeks ago         1.113 MB
    busybox             glibc               54df49495ae4        2 weeks ago         4.18 MB
    mysql               latest              7a5866c2edbf        2 weeks ago         361.2 MB
    nginx               latest              af4b3d7d5401        3 weeks ago         190.5 MB

### 2. Create additional volumes
Hyper.sh creates a 10GB root volume for each container. In the case that you need extra disk space, you can create a data volume:

	$ hyper volume create --size 10 --name data    # size in GB
	data

### 3. Launch the container

	$ hyper run -d -p 80 -v data:/data --name myweb nginx
	myweb

`-v data:/data` tells Hyper.sh to mount the volume `data` onto the new container at the path `/data`, and `-p 80` indicates http port 80 is published.

### 4. Attach a floating IP
Hyper.sh creates a default private network for each account. The new container is launched in your own private network, which Hyper.sh creates by default. In the private network, an internal IPv4 address is assigned to the container automatically. This IP address is not reachable from other networks or the Internet.

To enable public Internet access to your application, you need to attach a floating IP address to the container:

	$ hyper fip allocate 1
	211.98.26.201
	$ hyper fip attach 211.98.26.201 myweb
	myweb

### 5. Test
- Open your browser
- Enter `http://211.98.26.201/`
- You should be able to see the default homepage of Nginx

### 6. Access the container
You can remotely access the container using the following command:

	$ hyper exec -it myweb /bin/sh

> NOTE: the connection is fully encrypted with the credential configured at your local computer.

### 8. Remove the container  (permanently)

    $ hyper rm -f myweb
    myweb

The volume will be unmounted but not deleted. The floating IP will be detached, but not released.

### Done!
