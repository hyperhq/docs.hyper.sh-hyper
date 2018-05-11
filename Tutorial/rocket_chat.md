# Deploy a sample container

Now, let's try to deploy an app. In this walk-through we chose [Rocket.chat](https://rocket.chat/), a popular open realtime webchat tool. To complete this tutorial, you will need the following:

- An active account in [Hyper](hyper.sh)
- Some credits or credit card info in your account
- Setup `hyper` CLI on your laptop, configured with the credential

### 1. Pull the image

The first step is to pull the image. However, instead of fetching to the laptop, `hyper pull` will
download the image to Hyper cloud. Open your terminal and enter:

    $ hyper pull rocketchat/rocket.chat


It usually takes several seconds for Hyper to fetch a image. Once completed, you can see them with:

	$ hyper images
	~~TODO~~

### 2. Allocate a floating IP 

To enable public Internet access to a container, you need to allocate a floating IP address：

	$ hyper fip allocate 1
	211.98.26.201

### 3. Create a persistent volume 

For most cases, stateful app (MongoDB) you should store the data on persistent volumes:

	$ hyper volume create 10
	vol-z93clfg6 is created
	
### 4. Launch MongoDB container with the volume

	$ hyper run mongo -v vol-z93clfg6:/data

### 5. Access your container

You can "login" the container using the following command:

	$ hyper exec mongo /bin/sh

NOTE: the connection is fully encrypted with the credential configured at your local computer.

### 6. Launch the container and connect with database

	$ hyper run rocketchat/rocket.chat --public_ip=211.98.26.201

### Done!
