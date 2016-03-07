# Floaing IP

A floating IP is a publicly-accessible IP address that can be assigned to one container. Floating IPs can be remapped to other containers in the same region, to mask the failure of container or application. 

Floating IP is associated with your Hyper_ account. You need to allocate new free IPs before assigning to containers:

    $ hyper fip allocate 4
    52.68.129.19
    52.68.129.20
    52.68.129.21
    52.68.129.22
    $ hyper fip assign

    


-------------------------

An Elastic IP address is a static IP address designed for dynamic cloud computing. With an Elastic IP address, you can mask the failure of an instance or software by rapidly remapping the address to another instance in your account. Your Elastic IP address is associated with your AWS account, not a particular instance, and it remains associated with your account until you choose to release it explicitly. An Elastic IP address is for use in a specific region only.

