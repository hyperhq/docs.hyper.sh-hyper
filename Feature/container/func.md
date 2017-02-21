# Hyper Func (Beta)

Hyper Func is a Docker-based serverless platform. You can wrap functions in Docker images and have them run on demand.

## How it works

Create a “Hello World” function:
``` bash
$ hyper func create --name helloworld ubuntu echo "Hello World"
```

Make a call of the function:
``` bash
$ hyper call helloworld
Request ID: 7f713fff-a65c-4004-b195-72b0c7bce84a
```
 
Get the output of the call:
``` bash
$ hyper func get --wait 7f713fff-a65c-4004-b195-72b0c7bce84a 
Hello World
```

Check the logs of the function:
``` bash
$ hyper func logs helloworld
```

Remove the function:
``` bash
$ hyper func rm helloworld
```

## Notes
* Hyper Func has a max concurrency of your account quota. Goto the the [Account](https://console.hyper.sh/account/) page to request a quota increase
* Every func includes 50MB of free space for STDIN and STDOUT data (with rotation)
