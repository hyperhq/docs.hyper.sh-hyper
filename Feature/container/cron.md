# Cron

In Hyper, cron is a system service that runs scheduled jobs at given intervals or times, just like the cron unix service but work with the containers.

## Cron expression
The original Cron reference documentation for this implementation is found at [here](https://en.wikipedia.org/wiki/Cron#CRON_expression), where Hyper Cron implementation differs:

	Field name     Mandatory?   Allowed values    Allowed special characters
	----------     ----------   --------------    --------------------------
	Minutes        Yes          0-59              * / , -
	Hours          Yes          0-23              * / , -
	Day of month   Yes          1-31              * / , -
	Month          Yes          1-12 or JAN-DEC   * / , -
	Day of week    Yes          0-6 or SUN-SAT    * / , -
	Year           No           1970–2099         * / , -

### Asterisk ( * )

The asterisk indicates that the cron expression matches for all values of the field. E.g., using an asterisk in the 4th field (month) indicates every month.

### Slash ( / )

Slashes describe increments of ranges. For example 3-59/15 in the minute field indicate the third minute of the hour and every 15 minutes thereafter. The form */... is equivalent to the form "first-last/...", that is, an increment over the largest possible range of the field.

### Comma ( , )

Commas are used to separate items of a list. For example, using MON,WED,FRI in the 5th field (day of week) means Mondays, Wednesdays and Fridays.

### Hyphen ( - )

Hyphens define ranges. For example, 2000-2010 indicates every year between 2000 and 2010 AD, inclusive.


## Examples

Create a cron job which will ping an address every 5 minutes:

	$ hyper cron create  --minute=*/5 --hour=* --name test-cron-job1 busybox ping -c 3 8.8.8.8

Check cron job list:

	$ hyper cron ls
	Name               Schedule            Image               Command
	test-cron-job1     */5 * * * *         busybox             ping -c 3 8.8.8.8

Check the execution history of a cron job:

    $ hyper cron history test-cron-job1
    Container                   Start                           End                             Status              Message
    test-cron-job1-1479265800   2016-11-16 03:10:00 +0000 UTC   2016-11-16 03:11:24 +0000 UTC   done                Job[test-cron-job1] is success to run
    test-cron-job1-1479266100   2016-11-16 03:15:00 +0000 UTC   2016-11-16 03:15:25 +0000 UTC   done                Job[test-cron-job1] is success to run
    test-cron-job1-1479266400   2016-11-16 03:20:00 +0000 UTC   2016-11-16 03:20:25 +0000 UTC   done                Job[test-cron-job1] is success to run
    test-cron-job1-1479266700   2016-11-16 03:25:00 +0000 UTC   2016-11-16 03:25:25 +0000 UTC   done                Job[test-cron-job1] is success to run
    test-cron-job1-1479267000   2016-11-16 03:30:00 +0000 UTC   -                               -                   Job[test-cron-job1] is running at 2016-11-16 03:30:00 +0000 UTC

Remove a cron job:

    $ hyper cron rm test-cron-job1
    test-cron-job1

## Notes
* All timestamps in Hyper Cron service is UTC+0.
* When a cron job container finished, Hyper Cron service will try to get `ExitCode` of the container.  If the value is non-zero, the cron job is `failed`.
* By default, a notification email will be sent to your Hyper account's email address, when a cron job failed.
* You may override to deliver the email to another address with `--mailto` flag.
* You may control the notification policy with `--mail` flag:
  * `on-failure` (default): send notification only when a cron job failed
  * `on-success`: send notification only when a cron job succeeded
  * `all`: always send notification
* The notification email contains the last 100 lines of log for the cron job container.
* When the Hyper Cron service is under maintaince, some cron jobs may be missed. In such case, a schedule-missed email will be sent to user.
* When a cron job container finished (either succeeded or failed), the container will be cleaned up within a minute.
* When you remove a cron job, it could be possible that there are cron job containers running. In such case, the container will be left running. A manual cleanup is needed.
* The cron service will not retry the failed cron job.
