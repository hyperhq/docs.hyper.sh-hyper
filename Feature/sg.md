# Security Group

In Hyper_, a security group acts as a virtual firewall that controls the traffic for one or more containers. You add rules to each security group that allow traffic to or from its associated containers.  When we decide whether to allow traffic to reach a container, we evaluate all the rules from all the security groups that are associated with the container:

- if a container has no associated security group, it is accessible (within the network it resides, as well as the Internet) 
- if a container has associated security group(s) with no `egress` rule, it cannot access the Internet
- if a container has associated security group(s) with no `ingress` rule, it is not accessible from other containers, nor the Internet

Security group works independently from port, e.g. **You need to publish the container ports even if the associated security group allows the traffic**.

### Create a security group
Security group is defined in a yaml file. **Please read [the security group reference](../Reference/sg_ref.md) for more details**.

``` bash
	$ cat ssh_sg.yaml
	name: ssh-sg
	description: sg-ssh-description
	rules:
	  - protocol: tcp
	    direction: ingress
		port_range_min: 22
		port_range_max: 22
		remote_ip_prefix: 0.0.0.0/0
	$ hyper sg create -f ssh_sg.yaml ssh-sg
```

### Associate security groups
When you launch a container, you associate one or more security groups with the container. 

``` bash
	$ hyper run --sg ssh-sg -d -P jdeathe/centos-ssh
	846434fface4d566d7ee06f7809f1065d9efbca732e2dd47184f6244162ee944
```

### Change security groups
You can update containers to add or remove containers.

``` bash
	$ hyper update --sg-add ssh-sg ssh-container
	ssh-container
```

To remove a security group from a container:

``` bash
	$ hyper update --sg-rm ssh-sg ssh-container
	ssh-container
```

### Update a security group
You can modify the rules for a security group on the fly; the new rules are automatically applied to all containers that are associated with the security group.  

``` bash
	$ cat ssh_sg_update.yaml
	name: ssh-sg
	description: sg-ssh-description
	rules:
	  - protocol: tcp
	    direction: ingress
		port_range_min: 22
		port_range_max: 23
		remote_ip_prefix: 0.0.0.0/0
	$ hyper sg update -f ssh_sg_update.yaml ssh-sg
```

### Remove a security group

``` bash
	$ hyper sg rm ssh-sg
```
> Note: You cannot remove a security group which is in use by containers.