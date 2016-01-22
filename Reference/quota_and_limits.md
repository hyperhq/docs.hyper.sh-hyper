# Quota & Limits

Hyper_ has certain hard and soft (`quota`) limits in using its service. Hard limits are automatically enforced by the Service. Soft limits are consumable resources that you may request to increase:

## Hard Limits
- Image
	- Maximum Image Size: 5GB – Hard
- CPU:
	- Maximum CPU cores per Container: 32 - Hard
- Disk
	- Maximum Container Disk Space (without Volume): 10GB – Hard
	- Maximum Volume Size: 1TB - Hard
	- Minimum Volume Size: 10GB - Hard
- Network
	- Maximum Floating IP per Container: 1 - Hard
	- Maximum Internal IP per Container: 1 - Hard

## Quota
- Container: 100 per region per account
- Image:  100 per region per account
- CPU:  20 cores per region per account
- Mem: 40 GB per region per account
- Disk
	- Total volume storage per region per account: 10TB
	- Volume: 1000 volumes per region per account
	- Snapshot: 2000 snapshots per region per account
- Floating IP: 5 per region per account

### Request a quota increase

Sign in the Hyper web console, open the support page.

Under Regarding, choose Service Limit Increase.

Under Limit Type, choose the type of limit to increase, fill in the necessary fields in the form, and then choose your preferred method of contact.
