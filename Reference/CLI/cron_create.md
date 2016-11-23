## cron create

Usage:	hyper cron create [OPTIONS] IMAGE [COMMAND] [ARG...]

	Create a new cron

	  --access-key             Access key to run the cron job
	  --container-name         Cron container name
	  --dom=*                  The day of month of cron expression
	  -e, --env=[]             Set environment variables
	  --entrypoint             Overwrite the default ENTRYPOINT of the image
	  --env-file=[]            Read in a file of environment variables
	  --expose=[]              Expose a port or a range of ports
	  -h, --hostname           Container host name
	  --help                   Print usage
	  --hour                   The hour of cron expression
	  -l, --label=[]           Set meta data on a container
	  --label-file=[]          Read in a line delimited file of labels
	  --link=[]                Add link to another container
	  --mail=on-failure        Mail policy to apply when to send email
	  --mailto                 Mail to while the cron has something
	  --minute                 The minutes of cron expression
	  --month=*                The month of cron expression
	  --name                   Cron name
	  --noauto-volume          Do not create volumes specified in image
	  -P, --publish-all        Publish all exposed ports to random ports
	  -p, --publish=[]         Publish a container's port(s) to the host
	  --restart=no             Restart policy to apply when a container exits
	  --secret-key             Secret key to run the cron job
	  --sg=[]                  Security group for each container
	  --size=s4                The size of cron containers (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3)
	  --stop-signal=SIGTERM    Signal to stop a container, SIGTERM by default
	  -v, ---volume=[]         Volume for each container
	  -w, --workdir            Working directory inside the container
	  --week=*                 The day of week of cron expression


### Examples

Create a cron job which ping an address every 5 minutes:

	$ hyper cron create --minute=*/15 --hour=* --name test-cron-job1 busybox ping -c 3 114.114.114.114
	latest: Pulling from library/busybox
	Digest: sha256:29f5d56d12684887bdfa50dcd29fc31eea4aaf4ad3bec43daf19026a7ce69912
	Status: Image is up to date for busybox:latest

	Cron test-cron-job1 is created.

Check the cron jobs:

	$ hyper cron ls
	Name                Schedule            Image               Command
	test-cron-job1      */5 * * * *         busybox             ping -c 3 114.114.114.114
