# Pricing & Billing

#### Container
|Size|CPU Core|Mem|Disk|Network|Per Second|Per Hour|Monthly|
|:-:|:-:|:-:|:-:|:-:|---|---|---|
|S1 |1|64MB |10GB|FREE|$0.0000004 |$0.00144|$1.03  |
|S2 |1|128MB|10GB|FREE|$0.0000006 |$0.00216|$1.55  |
|S3 |1|256MB|10GB|FREE|$0.000001  |$0.0036 |$2.59  |
|S4 |1|512MB|10GB|FREE|$0.000002  |$0.0072 |$5.18  |
|M1 |1|  1GB|10GB|FREE|$0.000004  |$0.0144 |$10.36 |
|M2 |2|  2GB|10GB|FREE|$0.000008  |$0.0288 |$20.73 |
|M3 |2|  4GB|10GB|FREE|$0.000015  |$0.054  |$38.88 |
|L1 |4|  4GB|10GB|FREE|$0.00003   |$0.108  |$77.76 |
|L2 |4|  8GB|10GB|FREE|$0.00006   |$0.216  |$155.52|
|L3 |8| 16GB|10GB|FREE|$0.00012   |$0.432  |$311.04|
> - Billing begins when Hyper.sh launches a new container or start a stopped container, ends when the container stops or terminates, either through an API call, or through container exists (success or failure).
> - Everytime you issue a `hyper run/start/restart` request, a default period of 10 second is billed. If a container runs for 5s, it will be billed for 10s; if it runs for 30s, it is billed for 30s.
> - Everytime a container is restarted, a default period of 10 second is billed. If a container runs for 5s, it will be billed for 10s; if it runs for 30s, it is billed for 30s.

#### Service
|Per Second|Per Hour|Monthly|
|---|---|---|
|$0.000003 |$0.0108|$7.78  |
> - Billing begins when a new service created, ends when it is terminated.

#### Storage
- Image: $0.1/GB/month
- Volume: $0.1/GB/month
- Snapshot: $0.05/GB/month
> - Billing begins when the storage object is created (`hyper volume create`, `hyper snapshot create`, `hyper pull`), ends upon removal
> - Images are charged per GB with a minimum of 1GB and will be rounded UP to nearest GB (i.e. 1.5GB billed at 2GB)

#### Network
- Floating IP: $1/IP/month
> - Billing begins when a new Floating IP is allocated, ends when it is released. Partial month is treated as a entire month.

#### Tax
Except as otherwise noted, our prices are exclusive of applicable taxes and duties, including VAT and applicable sales tax. Currently, we charges VAT for credits cards issued in NY and Texas. The tax details will be available in the monthly bill.

#### Payment Method
Currently Hyper.sh accepts credit cards. Please note that all payments are processed by trusted third party payment service. No credit card information are kept in Hyper.sh.

#### Billing Period
We charge your credit card on the 1st day of each month after usage.

#### Outstanding Balance

Balances are considered outstanding if a payment has failed to process on the first of the month. In such case, we will notify you over emails, and re-submit the payment request:

- Re-submit after 3 days if the first request failed
- Re-submit after 5 days if the second request failed
- Re-submit after 7 days if the third request failed, and during this period you will not be able to create / update resource in your account
- If the fourth request failed, we will stop the containers in your account, but you can login the web console to update the credit card information, which will trigger new payment request
- If the balance is due over two months, we will deactivate your account (unable to login web console and all credential will be removed), and purge all resources in your account permanently
- Whenever a payment request succeeded, we will immediately resume your account

If you have any questions about an outstanding balance, how to add a payment option, or about billing in general, please feel free to contact [Hyper.sh Support](mailto:support@hyper.sh).

#### Remove Credit Card

- To remove your credit card information, please make sure that there is no payment due and no any resources in your account.
- If there is payment due, you need to update the card to fullfill the payment first.
- Once the credit card information is removed, your account will be limited. You can add the card to re-enable the account.
