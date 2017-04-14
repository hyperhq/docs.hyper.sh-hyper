## cron delete

	Usage:	hyper cron rm [OPTIONS] cron [cron...]

	Remove one or more crons

	  --help             Print usage


### Examples

Remove a cron job:
	
	$ hyper cron rm test-cron-job1
	test-cron-job1
	$ hyper cron ls
	Name                Schedule            Image               Command