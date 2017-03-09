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
4. The queued calls are processed in the ***First-In-First-Out*** manner. However we cannot guarantee the function execution will be completed in such order.
5. Hyper Func maintains a 50MB cache for each function (**not call**). The cache is used to store the STDOUT of **completed** function calls. These data need to be fetched by `hyper func get`. Otherwise the cache will be rotated once full.
6. For each function call, the max data size of STDIN and STDOUT is 5MB.
7. The headers of HTTP request and the env config of function will be as the environment variable of container.

## Usage

1. Create a "Hello World" function:
``` bash
$ hyper func create --name helloworld ubuntu echo Hello World
helloworld is created with the address of https://us-west-1.hyperfunc.io/call/helloworld/e5304888-f112-11e6-bc64-92361f002671
```

2. Call the function:
``` bash
$ hyper func call helloworld
CallId: 7f713fff-a65c-4004-b195-72b0c7bce84a
```
> Tips: calling with payload `echo Hello | hyper func call helloworld`

3. Check the function logs:
``` bash
$ hyper func logs helloworld
2017-02-10T04:05:26.704Z [CALL] CallId: 7f713fff-a65c-4004-b195-72b0c7bce84a, ShortStdin:
2017-02-10T04:05:27.704Z [PENDING] CallId: 7f713fff-a65c-4004-b195-72b0c7bce84a
2017-02-10T04:05:27.704Z [RUNNING] CallId: 7f713fff-a65c-4004-b195-72b0c7bce84a
2017-02-10T04:05:27.704Z [COMPLETED] CallId: 7f713fff-a65c-4004-b195-72b0c7bce84a, ShortStdout: Hello World
```

4. Retrieve the function return:
``` bash
$ hyper func get --wait 7f713fff-a65c-4004-b195-72b0c7bce84a
Hello World
```
> Tips: `--wait` blocks the CLI until the call completed (or failed)

5. Remove the function:
``` bash
$ hyper func rm helloworld
helloworld
```
