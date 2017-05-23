## fip name

    Usage:  hyper fip name [OPTIONS] FIP [NAME]

    Set name for a floating IP

      --help             Print usage

Set a name for a floating IP:

	$ hyper fip name 211.98.26.102 mywebip
	mywebip

You can also control the floating IP with its name, such as:

    $hyper run -d --name myweb -P nginx
    ae1d40ca3026d76d577a90b9014b3c275307d059c9c3697e831cf85e6aab5a2f
    $ hyper fip attach mywebip myweb
    $ hyper fip ls
    Floating IP         Name                Container                                                          Service
    211.98.26.102       mywebip             ae1d40ca3026d76d577a90b9014b3c275307d059c9c3697e831cf85e6aab5a2f
