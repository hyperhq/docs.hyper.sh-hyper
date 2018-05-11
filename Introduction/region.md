# Regions

Hyper regions are physical data centers isolated from one another. When you view your resources, you'll only see the resources tied to the region you've specified. This is because regions are isolated from each other, and are not replicated across regions automatically.

The following table lists the regions provided by Hyper
<table class="table table-bordered table-striped table-condensed">
<tr>
<td>Region</td><td>Location</td>
</tr>
<tr>
<td>us-west-1</td><td>Los Angeles</td>
</tr>
<tr>
<td>eu-central-1</td><td>Frankfurt</td>
</tr>
</table>

### Specify Your Regions
We now have support for two regions. You may specify the region via the `--region` option when you want to manage the resources for that specific region. The `us-west-1` region will be the default region.

You can only use the `--region` option if first run the command `hyper config`. Otherwise all commands will default to the `us-west-1` region.

#### Setup the region credential
```
$ hyper config
Enter Access Key: HYPERTHEMOSTEASYCONTAINER
Enter Secret Key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Enter Default Region (us-west-1):    # if set Europe region, it will be default region.
WARNING: Your login credentials has been saved in /home/lei/.hyper/config.json
```

#### Specify a different region with the `--region` option
```
$ hyper --region us-west-1 run -d busybox ping -c 30 8.8.8.8
e697934c9577171cf06bc6d458124306d54de9543ad74f2afb58fcf97a888b22
$ hyper --region us-west-1 ps
CONTAINER ID        IMAGE                                       COMMAND                  CREATED             STATUS                      PORTS                                              NAMES                       PUBLIC IP
e697934c9577        busybox                                     "ping -c 30 8.8.8.8"     52 seconds ago      Exited (0) 19 seconds ago                                                      evil-pike
# run `ps` with different region
$ hyper --region eu-central-1 ps
CONTAINER ID        IMAGE                                       COMMAND                  CREATED             STATUS                      PORTS                                              NAMES                       PUBLIC IP
```

A more detailed introduction to the hyper command line can be found here: [CLI index](../Reference/CLI/index.md).

### Layout of the region config file
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

You may find that there is a new field named `region`, it identifes which region is the default region. You may edit it with any editor, but we do recommand you modify it via `hyper config` command.
