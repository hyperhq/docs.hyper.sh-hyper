# Quota & Limits

Hyper_ has certain hard and soft (`quota`) limits in using its service. Hard limits are automatically enforced by the Service. Soft limits are consumable resources that you may request to increase:

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
- Floating IP: 10 per region

### Request a quota increase

Sign in Hyper_ console, open the support page.

Under Regarding, choose Service Limit Increase.

Under Limit Type, choose the type of limit to increase, fill in the necessary fields in the form, and then choose your preferred method of contact.