# Deploy a sample app

Now, let's try to deploy some app. In this walk-through we choose [Rocket.chat](https://rocket.chat/), which is an amazing real time web-based chat tool. To cimplete the tutorial, you need the following:

- An active account on [Hyper.sh](hyper.sh)
- Some credits or credit info in your account
- `hyper` CLI on your laptop, with your credential configured

### 1. Pull the image

Rocket.chat requires two Docker imaes: the app itself and MongoDB. To pull the images into Hyper_, open a shell session on your computer, and enter

	$ hyper pull rocketchat/rocket.chat mongo

It usually takes several seconds for Hyper_ to fetch these images. Once completed, you can see them with:

	$ hyper images
	~~TODO~~

### 2. Allocate a floating IP 

To allow Internet access on the web container, you need to allocate a floating IP address：

	$ hyper fip reserve 1
	211.98.26.201

### 3. Create a persistent volume 

For most cases, stateful app (MongoDB) should store the data on persistent volumes:

	$ hyper volume create 10
	vol-z93clfg6 is created
	
### 4. Launch MongoDB container with the volume

	$ hyper run mongo -v vol-z93clfg6:/data

### 5. Acess your container

The following command setup a remote shell session between your local computer and the container:

	$ hyper exec mongo /bin/sh

NOTE: the connection is fully encrypted with the Hyper_ credential on your local computer.

### 6. Launch the container and connect with database

	$ hyper run rocketchat/rocket.chat --public_ip=211.98.26.201

### Done!

