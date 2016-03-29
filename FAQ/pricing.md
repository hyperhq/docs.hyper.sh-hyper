# Pricing

#### Container
|Size|CPU Core|Mem|Disk|Network|Per Second|Monthly|
|:-:|:-:|:-:|:-:|:-:|---|---|
|xxs|1|256MB|10GB|FREE|\$0.0000008|\$2.76|
|xs |1|512MB|10GB|FREE|\$0.0000015|\$5.18|
|s  |1|  1GB|10GB|FREE|\$0.000003 |\$10.3|
|m  |2|  2GB|10GB|FREE|\$0.000006 |\$20.7|
|l  |2|  4GB|10GB|FREE|\$0.000012 |\$41.4|
|xl |4|  4GB|10GB|FREE|\$0.000024 |\$82.9|
|xxl|4|  8GB|10GB|FREE|\$0.00005  |\$172.8|
|xxxl|8|16GB|10GB|FREE|\$0.0001   |\$345.6|
> - Billing begins when Hyper\_ launches a new container or start a stopped container, ends when the container stops or terminates, either through an API call, or through container exists (success or failure).
> - Everytime you issue a `hyper run/start` request, a default period of 10 second is billed. If a container runs for 5s, it will be billed for 10s; if it runs for 30s, it is billed for 30s.

#### Storage
- Image: $0.05/GB/month
- Volume: $0.1/GB/month
- Snapshot: $0.1/GB/month
> Billing begins when the storage object is created (`hyper volume create`, `hyper snapshot create`, `hyper pull`), ends upon removal.

#### Network
- Floating IP: $1/IP/month
> Billing begins when a new Floating IP is allocated, ends when it is released. Partial month is treated as a entire month.

#### Tax
Except as otherwise noted, our prices are exclusive of applicable taxes and duties, including VAT and applicable sales tax.
