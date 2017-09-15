# Quota & Limits

Hyper.sh has certain hard and soft (`quota`) limits in using its service. Hard limits are automatically enforced by the service. Soft limits are consumable resources that you may request to increase:

## Hard Limits
- Image
	- Max image size: 5GB
- Volume
	- Root volume size: 10GB
	- Volume size range: 10GB - 50GB
	- Max number of volumes mounted on one container: 4
- Network
	- Max floating IP per container: 1
	- Max internal IP per container: 1
- Function
	- Max size of function input (STDIN): 1MB
	- Max size of function output (STDOUT): 1MB
	- Cache size of completed function calls: 50MB

## Quota
- Container: 10 per region
- Image:  20 per region
- Storage
	- Volume: 40 volumes per region
	- Snapshot: 40 snapshots per region
- Floating IP: 2 per region
- Credential: 3 per region
- Security Group: 100 per region
- Service: 5 per region
- Concurrent function execution (container): 10 per region

> Note: Beta services are not open for higher quota
> - Hyper Cron
> - Hyper Func

### Request a quota increase

Open the [Overview](https://console.hyper.sh/overview/) page, click `Request Quota Increase`:

![](https://trello-attachments.s3.amazonaws.com/5700ea0da7030dcf7485ed70/57ac415d5c5774e392d184a5/54e79f48f900bc73590d58964c80cd92/quota.png)

In the dialog popup, fill in your request and use case details. It usually takes 1-2 business days for us to review the request and get back to you.
