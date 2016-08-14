# Compose

Compose is a sub-command for defining and running multi-container applications. With this, you use a Compose file to configure your application’s services. Then, using a single command, you create and start all the services from your configuration in Hyper_ cloud.

Compose is great and easy to test and deploy your production, as well as CI workflows. You can learn more about each case in Common Use Cases.

Using Compose is basically a three-step process.

* Define your app’s Docker Images and push them to Docker hub or private registry, so it can be reproduced anywhere.
* Define the services that make up your app in docker-compose.yml so they can be run together in an isolated environment.
* Lastly, run `hyper compose up` and Compose will start and run your entire app.

A docker-compose.yml looks like this:

	version: '2'
	services:
	  web:
	    image: wordpress:latest
	    fip: 147.75.99.77
	    links:
	      - db:mysql
	    depends_on:
	      - db
	  db:
	    image: mysql:latest
	    environment:
	        - MYSQL_ROOT_PASSWORD=my-secret-pw


For more information about the Compose file, see the [Compose file reference](../Reference/compose_file_ref.md)

Compared with docker compose specification, hyper compose support two more fields:
* `size` - container size for the service, we support ten different sizes, you can find more details at [here](../FAQ/pricing.md). 
* `fip` - floating IP for service

Compose has commands for managing the whole lifecycle of your application:

* Start, stop services
* View the status of running services
* Stream the log output of running services
* Run a one-off command on a service

