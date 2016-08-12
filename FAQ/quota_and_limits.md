# Quota & Limits

Hyper\_ has certain hard and soft (`quota`) limits in using its service. Hard limits are automatically enforced by the service. Soft limits are consumable resources that you may request to increase:

## Hard Limits
- Image
	- Max Image Size: 5GB
- Volume
	- Root Volume Size: 10GB
	- Volume Size Range: 10GB - 50GB
	- Max number of volumes mounted on one container: 4
- Network
	- Max Floating IP per Container: 1
	- Max Internal IP per Container: 1

## Quota
- Container: 10 per region
- Image:  20 per region
- Storage
	- Volume: 40 volumes per region
	- Snapshot: 40 snapshots per region
- Floating IP: 5 per region

### Request a quota increase

Open the [Account](https://hyper.sh/account) page, choose `Quota`, click `Request Quota Increase`:

![](https://trello-attachments.s3.amazonaws.com/57ac415d5c5774e392d184a5/2374x1104/864d7065d6e9bb4bbc15cfa23bf0b59e/quota.png)

In the dialog popup, fill in your request and use case details. It usually takes 1-2 business days for us to review the request and get back to you.
