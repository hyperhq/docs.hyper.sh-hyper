# Service Level Agreement (SLA)

Our SLA guarantees a Monthly Uptime Percentage of at least 99.9% for Hyper_ services within a Region. Lost time is refunded back to your account at the hourly rate incurred.

### Service Commitment
AWS will use commercially reasonable efforts to make Amazon EC2 and Amazon EBS each available with a Monthly Uptime Percentage (defined below) of at least 99.95%, in each case during any monthly billing cycle (the “Service Commitment”). In the event Amazon EC2 or Amazon EBS does not meet the Service Commitment, you will be eligible to receive a Service Credit as described below.

### Definitions
“Monthly Uptime Percentage” is calculated by subtracting from 100% the percentage of minutes during the month in which Amazon EC2 or Amazon EBS, as applicable, was in the state of “Region Unavailable.” Monthly Uptime Percentage measurements exclude downtime resulting directly or indirectly from any Amazon EC2 SLA Exclusion (defined below).
“Region Unavailable” and “Region Unavailability” mean that more than one Availability Zone in which you are running an instance, within the same Region, is “Unavailable” to you.
“Unavailable” and “Unavailability” mean:
For Amazon EC2, when all of your running instances have no external connectivity.
For Amazon EBS, when all of your attached volumes perform zero read write IO, with pending IO in the queue.
A “Service Credit” is a dollar credit, calculated as set forth below, that we may credit back to an eligible account.
