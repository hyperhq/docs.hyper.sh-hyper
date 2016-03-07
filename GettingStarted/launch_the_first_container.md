# Deploy a sample container

Now, let's try to launch a container. To complete this tutorial, you need the following:

- An active account in [Hyper_](hyper.sh)
- Some credits or credit card info in your account
- Setup `hyper` CLI on your laptop, configured with the credential

### 1. Pull the image

The first step is to pull the image. However, instead of fetching to the laptop, `hyper pull` will
download the image to Hyper_ cloud. Open your terminal and enter:

    $ hyper pull nginx

It usually takes several seconds for Hyper_ to fetch a image. Once completed, you can see them with:

	$ hyper images
	~~TODO~~

### 2. Allocate a floating IP 

To enable public Internet access to the container, you can allocate a floating IP address：

	$ hyper fip allocate 1
	211.98.26.201

### 3. Create a persistent volume 

In the case that you prefer to store data on an additional disk, you can create a persistent volume:t cases, stateful app (MongoDB) should store the data on persistent volumes:

	$ hyper volume create 10     # size in GB
	vol-z93clfg6 is created
	
### 4. Launch the container

	$ hyper run nginx -v vol-z93clfg6:/data myweb
	myweb

### 5. Associate the floating IP with the container

    $ hyper associate 211.98.26.201 myweb
    myweb

### 6. Test
- open your browser
- enter `http://211.98.26.201/`

### 7. Access your container

You can remotely access the container using the following command:

	$ hyper exec myweb /bin/sh

NOTE: the connection is fully encrypted with the credential configured at your local computer.

### 8. Remove the container

    $ hyper rm myweb
    myweb

### Done!
