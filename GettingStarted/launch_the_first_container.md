# Launch the first container

Now, let's try to launch a container. To complete this tutorial, you need the following:

- An active account in [Hyper_](hyper.sh)
- Some free credits or credit card info in your account
- Setup `hyper` CLI on your laptop, configured with the credential

### 1. Pull the image

Firstly, you need to pull the image, but the image is not pulled to your laptop. Instead, `hyper pull` will fetch the image to Hyper_ cloud. Open your terminal and enter:

    $ hyper pull nginx

It usually takes several seconds to pull a image, depending on the connection between Hyper_ cloud and the registry where the image resides. Once completed, you can see the image in your Hyper_ cloud:

	$ hyper images
	~~TODO~~

### 2. Create a persistent volume 

To store data on an additional disk, you can create a persistent volume:

	$ hyper volume create 10     # size in GB
	vol-z93clfg6 is created
	
### 3. Launch the container

	$ hyper run nginx -v vol-z93clfg6:/data myweb
	myweb

### 4. Associate a floating IP
By default, Hyper_ creates a default Layer-2 private network for your account. When the container is launched, it is automatically placed in your private network with a private IP address. This ensures that all your containers are within the same network, and isolated with other containers and the Internet. 

To enable public Internet access to the container, you need to associate a floating IP address to the container:

	$ hyper fip allocate 1
	211.98.26.201
	$ hyper associate 211.98.26.201 myweb
	myweb

### 5. Test
- Open your browser
- Enter `http://211.98.26.201/`
- You should be able to see the default homepage of nginx

### 6. Access the container

You can remotely access the container using the following command:

	$ hyper exec myweb /bin/sh

> NOTE: the connection is fully encrypted with the credential configured at your local computer.

### 8. Remove the container  (permanently)

    $ hyper rm myweb
    myweb

> The volume will be unmounted but not deleted. The floating IP will be de-associated, but not released.

### Done!
