# Security Group File Reference

The security group file is a YAML file defining the security group and its rules. Below is an exmaple:

```
name: sg-test-1
description: sg-test-description
rules:
- direction: ingress
  port_range_min: 22
  port_range_max: 22
  protocol: tcp
  remote_ip_prefix: "0.0.0.0/0"
```

### name
> The name of this security group.

### description
> The short description of this security group.

### rules
> The rules for this security group to define the incoming and/or outcoming internet traffic.

### port_range_min
> The minimum port number in the range that is matched by the security group rule. If the protocol is TCP or UDP, this value must be less than or equal to the value of the `PortRangeMax` attribute. If the protocol is ICMP, this value must be an ICMP type.

### port_range_max
> The maximum port number in the range that is matched by the security group rule. The `PortRangeMin` attribute constrains the `PortRangeMax` attribute. If the protocol is ICMP, this value must be an ICMP type.

### direction
> The direction in which the security group rule is applied. The only values allowed are `ingress` or `egress`. For a container, an ingress security group rule is applied to incoming (ingress) traffic for that container. An egress rule is applied to traffic leaving the container.

### protocol
> The protocol that is matched by the security group rule. Valid values are `tcp`, `udp`, `icmp` or an empty string.

### remote_ip_prefix
> The remote IP prefix to be associated with this security group rule. You can specify either `RemoteGroupID` or `RemoteIPPrefix`. This attribute matches the specified IP prefix as the source IP address of the IP packet.

### remote_group_name
> ***Optional*** The remote group ID to be associated with this security group rule. You can specify either `remote_group_name` or `remote_ip_prefix`.
