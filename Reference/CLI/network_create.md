#### network_create

    Usage:  hyper network create [OPTIONS] NETWORK-NAME

    Creates a new network with a name specified by the user

        --aux-address=map[]      auxiliary ipv4 or ipv6 addresses used by Network driver
        -d, --driver=bridge      Driver to manage the Network
        --gateway=[]             ipv4 or ipv6 Gateway for the master subnet
        --help                   Print usage
        --internal               restricts external access to the network
        --ip-range=[]            allocate container ip from a sub-range
        --ipam-driver=default    IP Address Management Driver
        --ipam-opt=map[]         set IPAM driver specific options
        -o, --opt=map[]          set driver specific options
        --subnet=[]              subnet in CIDR format that represents a network segment
