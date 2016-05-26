# Pricing & Billing

#### Container
|Size|CPU Core|Mem|Disk|Network|Per Second|Monthly|
|:-:|:-:|:-:|:-:|:-:|---|---|
|xxs|1|256MB|10GB|FREE|$0.000001 |$2.59  |
|xs |1|512MB|10GB|FREE|$0.000002 |$5.18  |
|s  |1|  1GB|10GB|FREE|$0.000004 |$10.36 |
|m  |2|  2GB|10GB|FREE|$0.000008 |$20.73 |
|l  |2|  4GB|10GB|FREE|$0.000015 |$38.88 |
|xl |4|  4GB|10GB|FREE|$0.00003  |$77.76 |
|xxl|4|  8GB|10GB|FREE|$0.00006  |$155.52|
|xxxl|8|16GB|10GB|FREE|$0.00012  |$311.04|
> - Billing begins when Hyper\_ launches a new container or start a stopped container, ends when the container stops or terminates, either through an API call, or through container exists (success or failure).
> - Everytime you issue a `hyper run/start/restart` request, a default period of 10 second is billed. If a container runs for 5s, it will be billed for 10s; if it runs for 30s, it is billed for 30s.
> - Everytime a container is restarted, a default period of 10 second is billed. If a container runs for 5s, it will be billed for 10s; if it runs for 30s, it is billed for 30s.

#### Storage
- Image: $0.1/GB/month
- Volume: $0.1/GB/month
- Snapshot: $0.05/GB/month
> - Billing begins when the storage object is created (`hyper volume create`, `hyper snapshot create`, `hyper pull`), ends upon removal.
> - Images less than 1GB will be charge for 1GB

#### Network
- Floating IP: $1/IP/month
> - Billing begins when a new Floating IP is allocated, ends when it is released. Partial month is treated as a entire month.

#### 税率
Except as otherwise noted, our prices are exclusive of applicable taxes and duties, including VAT and applicable sales tax.

目前我们会为持美国纽约州(NY)和德克萨斯州(TX)的信用卡收取额外的销售税, 所收具体税额会显示在每月的历史账单中.

#### 计费周期
我们会在每月1日结算并扣除上月所产生的费用.

#### 欠费处理

若结算时扣费失败(例如您未绑定信用卡或信用卡无效时), 我们将发送邮件提醒, 并在一段时间后多次重试扣费:

1. 第1次扣费失败, 我们会在3天后再次重试扣费
2. 第2次扣费失败, 我们会在5天后再次重试扣费
3. 第3次扣费失败, 我们会限制(Restrict)您的账户做任何的创建/更新资源的操作, 并会在7天后再次重试扣费
4. 第4次扣费失败, 我们会停止您的账户中所有运行的Container
5. 欠费超过2个月后, 我们会冻结(Deactivate)您的账户(不能够登录Console且所有Credential将失效), 并删除账户下所有资源数据

在您恢复支付后(例如您更新了信用卡或信用卡恢复正常后), 我们会尝试扣除所欠费用, 并在支付成功后停止欠费处理并解除账户限制.

#### 奖励(Referral)
注册账户后, 您将获得$20初始的免费额度(Credit). 您可以在[Billing](https://console.hyper.sh/billing/credit)页面分享Referral链接给您的好友, 当他注册后他会获得$20初始的免费额度+$10奖励, 当他的实际花费达到$25时, 您也将获得$25的奖励.

#### 优惠码(Promo Code)
您可以通过一些渠道(例如我们的博客或邮件赠送)获得我们发放的优惠码, 在[Billing](https://console.hyper.sh/billing/credit)页面使用该优惠码增加您的账户额度.
