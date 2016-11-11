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

# General FAQ

#### What payment types do you accept?
Currently, Hyper.sh accepts credit cards, including Visa, MasterCard, American Express, JCB, Discover, and Diners Club.

#### Does Hyper.sh keep my credit card information?
No, all payments are processed through Stripe, a trusted third party payment processing service. Hyper.sh does not retain any credit card information.

#### Why was my card declined?

Our third party payment processing service employs specific checks against card payments. Some of the reasons your card was declined could be:

1. **The zip code you supplied failed validation.**: You can leave the Zip Code as blank and try again if your card not located in US.
2. **Your card's security code is incorrect.**: Currently we require CVC verification.
3. **Your card does not support this type of purchase.**: Please get in touch with your bank to confirm the reason declining the payments.

#### When will my credit card be charged?
We charge your credit card on the 1st day of each month.

#### How about the billing tax?
Except as otherwise noted, our prices exclude applicable sales tax and VAT. Currently, we charge sales tax for credit cards issued in the US states of NY and Texas. The tax details will be available in the monthly bill.

#### What happens after outstanding balance?

- First Payment Attempt: Credit card payment charged on 1st of the month. You will receive email notification of failed credit card charge and to update credit card information in web console.
- Second Payment Attempt: Submitted 3 days after first attempt, if the first charge fails, during this period you will be unable to create / update resources in your account.
- Third Payment Attempt: Submitted 5 days after second attempt, if the second charge attempt fails. If third attempt fails, we will stop all containers in your account.
- If the balance is due over 30 days, we will deactivate your account (unable to login to web console, removal of all credentials), and permanently purge all resources in your account.
- You can login the web console to update your credit card information, which will trigger new payment request, whenever a payment request succeeds, we will immediately resume your account.

If you have any questions about an outstanding balance, how to add a payment option, or about billing in general, please feel free to contact [Hyper.sh Support](mailto:support@hyper.sh).

#### How do I remove my credit card?

You can go to https://console.hyper.sh/billing/credit to add/update/delete your credit card.
- First please make sure that there is no payment due and that there are no resources left in your account.
- If there is payment due, you will need to update the credit card to first fullfill the payment.
- Once the credit card information is removed, your account will be limited. You can add a credit card to re-enable your account.
