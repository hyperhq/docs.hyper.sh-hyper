# Regions

Each Hyper region is designed to be completely isolated from the other Hyper regions. This achieves the greatest possible fault tolerance and stability.

When you view your resources, you'll only see the resources tied to the region you've specified. This is because regions are isolated from each other, and we don't replicate resources across regions automatically.

The following table lists the regions provided by Hyper.sh
<table class="table table-bordered table-striped table-condensed">
<tr>
<td>Region</td><td>Location</td>
</tr>
<tr>
<td>us-west-1</td><td>Los Angels</td>
</tr>
<tr>
<td>eu-1</td><td>Europe</td>
</tr>
</table>

### Specify Your Regions
Now, we have supported two regions. You may specify the region via `--region` option when you want to operate the resources which region located in. The Los Angels region will be default region.

You can not use `--region` option if you do not run the command `hyper config`, only default(Los Angels) region can be used.

#### Setup the region credential
```
$ hyper config
Enter Access Key: HYPERTHEMOSTEASYCONTAINER
Enter Secret Key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Enter Default Region (us-west-1):    # if set Europe region, it will be default region.
WARNING: Your login credentials has been saved in /home/lei/.hyper/config.json
```

#### Use the different region with `--region` option
```
$ hyper --region us-west-1 run -d busybox ping -c 30 8.8.8.8
e697934c9577171cf06bc6d458124306d54de9543ad74f2afb58fcf97a888b22
$ hyper --region us-west-1 ps 
CONTAINER ID        IMAGE                                       COMMAND                  CREATED             STATUS                      PORTS                                              NAMES                       PUBLIC IP
e697934c9577        busybox                                     "ping -c 30 8.8.8.8"     52 seconds ago      Exited (0) 19 seconds ago                                                      evil-pike
# run `ps` with different region
$ hyper --region eu-1 ps
CONTAINER ID        IMAGE                                       COMMAND                  CREATED             STATUS                      PORTS                                              NAMES                       PUBLIC IP
```

The more detailed introduction of hyper command is at [CLI index](../Reference/CLI/index.md).

### Layout of different region config file
```
{
	"auths": {},
	"clouds": {
		"tcp://*.hyper.sh:443": {
			"accesskey": "HYPERTHEMOSTEASYCONTAINER",
			"secretkey": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
			"region": "us-west-1"
		}
	}
}
```

You may find that there is a new field named `region`, it identifes which region is the default region. You can edit it with any editor, but we do recommand you modify it via `hyper config` command.
