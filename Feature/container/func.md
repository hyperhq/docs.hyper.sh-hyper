# Func (Beta)

Hyper Func is a Docker-centric Serverless platform. You can wrap functions in Docker images and have them run on demand.

- Fire and forget
	- Fully managed service
    - Easy to use for developers
    - Minimal ops overhead
- Docker centric
	- Deploy your function in Docker image
	- Any language, any libs, any deps
- Secure Container Runtime
	- VM-like isolation
	- New container instance for each function call
	- Run as long as you wish

## How it works

1. Hyper Func uses the popular Docker images as the format to deploy functions. Baking the code, dependencies, data into Docker images, and then register the images to create functions.
2. Upon calling, a new container will be launched from the function image. The HTTP request payload is passed to the container STDIN as the function input. A new call ID will be returned, which can be used to retrieve the output later.
3. The max concurrent function calls a user could execute at a given time is subject to the user's quota. When the max concurrency is reached, new calls will be queued to wait for slots.
4. The queued calls are processed in the ***First-In-First-Out*** manner. However we cannot guarantee the function execution will be finished in such order.
5. Hyper Func maintains a 50MB cache for each function (**not call**). The cache is used to store the STDOUT of **finished** function calls. These data need to be fetched by `hyper func get`, and then will be removed once be fetched. Otherwise the cache will be rotated once full.
6. Hyper Func maintains a 50MB cache for logs of each function. These data need to be fetched by `hyper func logs`. Otherwise the cache will be rotated once full.
7. For each function call, the max data size of STDIN and STDOUT is 5MB.
8. The headers of HTTP request and the env config of function will be as the environment variable of container.

## Usage

1. Create a "HelloWorld" function:
``` bash
$ hyper func create --name helloworld ubuntu echo HelloWorld
helloworld is created with the address of https://us-west-1.hyperfunc.io/call/helloworld/e62c014e-386c-42ea-8d07-41d44e98cc3d
```

2. Call the function:
``` bash
$ hyper func call helloworld
CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06
```
> Tips: calling with payload `echo Hello | hyper func call helloworld`

3. Check the function logs:
``` bash
$ hyper func logs helloworld
2017-03-16T15:05:58Z [CALL] CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06, ShortStdin: 
2017-03-16T15:05:58Z [PENDING] CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06
2017-03-16T15:06:04Z [RUNNING] CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06
2017-03-16T15:06:10Z [FINISHED] CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06, ShortStdout: HelloWorld
, ShortStderr: 
```

4. Retrieve the function return:
``` bash
$ hyper func get --wait 218b7b10-e7f1-4c48-ac3c-66792f8ffc06
HelloWorld
```
> Tips: `--wait` blocks the CLI until the call finished (or failed)

5. Remove the function:
``` bash
$ hyper func rm helloworld
helloworld
```
