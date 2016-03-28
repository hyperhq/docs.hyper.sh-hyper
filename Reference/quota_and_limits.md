# Quota & Limits

Hyper_ has certain hard and soft (`quota`) limits in using its service. Hard limits are automatically enforced by the service. Soft limits are consumable resources that you may request to increase:

## Hard Limits
- Image
	- Max Image Size: 5GB
- Volume
	- Root Volume Size: 10GB
	- Volume Size Range: 10GB - 1TB
	- Max number of volumes mounted on one container: 4
- Network
	- Max Floating IP per Container: 1
	- Max Internal IP per Container: 1

## Quota
- Container: 50 per region
- Image:  100 per region
- Storage
	- Volume: 200 volumes per region
	- Snapshot: 400 snapshots per region
- Floating IP: 5 per region

### Request a quota increase

Open the [Account](https://hyper.sh/account) page, choose `Quota`, click `Request Quota Increase`:

![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/1076x535/73ea2fdf183a69c3a68628d9a217d2f0/request_quota_increase.png)

In the dialog popup, fill in your request and use case details. It usually takes 1-2 business days for us to review the request and get back to you.

