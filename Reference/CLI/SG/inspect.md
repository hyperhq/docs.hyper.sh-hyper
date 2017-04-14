## sg inspect

	Usage:	hyper sg inspect [OPTIONS] NAME

	Inspect the security group

		--help               Print usage
		-o, --output=json    Output format with inspect operation

	$ hyper sg inspect web-sg
	{
	    "name": "web-sg",
	    "description": "web sg",
	    "rules": [
	        {
	            "direction": "ingress",
	            "port_range_min": 80,
	            "port_range_max": 80,
	            "protocol": "tcp",
	            "remote_ip_prefix": "0.0.0.0/0",
	            "remote_group_name": ""
	        }
	    ]
	}
