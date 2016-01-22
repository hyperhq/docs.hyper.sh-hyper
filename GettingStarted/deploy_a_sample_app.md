# Deploy a sample app

Now, let's try to deploy some app. In this walk-through we choose [Hummingbird](https://github.com/mnutt/hummingbird). Hummingbird  is an amazing real time web analytics tool built with node.js and web sockets. To cimplete the tutorial, you need the following:

- An active account on [Hyper.sh](hyper.sh)
- Some credits or credit info in your account
- `hyper` CLI on your laptop, with your credential configured

### 1. Pull the image

First of all, open a shell session, and enter

	$ hyper pull hummingbird
	$ hyper pull mysql

The command will pull the Hummingbird image from Docker Hub to HyperServe cloud. 

### 2. Allocate a floating IP 

To allow Internet access on the web container, you need to allocate a floating IP address：

	$ hyper fip reserve 1
	211.98.26.201

### 2. Create a persistent volume 


	$ hyper volume create 10
	vol-z93clfg6 is created
	
### 5. Launch DB container and mount the volume

	$ hyper run mysql -v vol-z93clfg6:/data

### 3. Launch the container and connect with database

	$ hyper run hummingbird --public_ip=211.98.26.201

### 4. Acess your container

The following command creates a new shell session in the container:

	$ hyper exec mybird /bin/sh

NOTE: `hyper` CLI uses the configures credential to encrypt the connection between your local terminal and the remote container. 
