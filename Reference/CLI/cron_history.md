## cron history

	Usage:	hyper cron history [OPTIONS] cron

	Show history of the cron job

		--help             Print usage
		--since            Show history since timestamp
		--tail=all         Number of lines to show from the end of the history


### Examples

	$ hyper cron create --minute=*/5 --hour=* --name test-cron-job1 busybox nano
	test-cron-job1
	$ hyper cron history test-cron-job1
	Container                   Start                           End                             Status              Message
	test-cron-job1-1479261300   2016-11-16 01:55:00 +0000 UTC   2016-11-16 01:56:04 +0000 UTC   failed              Failed to run job[test-cron-job1]: Exited 127
	test-cron-job1-1479261600   2016-11-16 02:00:00 +0000 UTC   2016-11-16 02:01:04 +0000 UTC   failed              Failed to run job[test-cron-job1]: Exited 127
	test-cron-job1-1479261900   2016-11-16 02:05:00 +0000 UTC   2016-11-16 02:06:04 +0000 UTC   failed              Failed to run job[test-cron-job1]: Exited 127
	test-cron-job1-1479262200   2016-11-16 02:10:00 +0000 UTC   2016-11-16 02:11:05 +0000 UTC   failed              Failed to run job[test-cron-job1]: Exited 127
	$ hyper cron history --tail=2 test-cron-job1
	Container                   Start                           End                             Status              Message
	test-cron-job1-1479261900   2016-11-16 02:05:00 +0000 UTC   2016-11-16 02:06:04 +0000 UTC   failed              Failed to run job[test-cron-job1]: Exited 127
	test-cron-job1-1479262200   2016-11-16 02:10:00 +0000 UTC   2016-11-16 02:11:05 +0000 UTC   failed              Failed to run job[test-cron-job1]: Exited 127
	$ hyper cron history --since=1479261900 test-cron-job1
	Container                   Start                           End                             Status              Message
	test-cron-job1-1479261900   2016-11-16 02:05:00 +0000 UTC   2016-11-16 02:06:04 +0000 UTC   failed              Failed to run job[test-cron-job1]: Exited 127
	test-cron-job1-1479262200   2016-11-16 02:10:00 +0000 UTC   2016-11-16 02:11:05 +0000 UTC   failed              Failed to run job[test-cron-job1]: Exited 127