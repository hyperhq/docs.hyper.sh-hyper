# Func (Beta)

Hyper Func is a Docker-based serverless platform. You can wrap functions in Docker images and have them run on demand. 它适用于一次性的 job 处理，例如典型的图片剪裁应用场景。

## How it works

一个标准的 func 工作流程如下：

1. 使用 CLI 或 endpoint 来 call 该 func，可以附带 payload。
2. func 运行一个指定 image 的 container，在 container 启动时将 payload 作为其 stdin。
3. 你可以在 container 中使用任何方式读取 stdin，做一些任务，最后向 stdout 写入数据作为返回结果。
4. 使用 CLI 或 endpoint 来获取返回结果。

## Example

1. 创建一个会输出 "Hello World" 的简单 func:

``` bash
$ hyper func create --name helloworld ubuntu echo Hello World
helloworld
```

2. 查询 func 的 logs，此时该命令会阻塞:

``` bash
$ hyper func logs helloworld
```

3. 然后切换到另外一个终端窗口，来 call 该 func:

``` bash
$ hyper call helloworld
Request ID: 7f713fff-a65c-4004-b195-72b0c7bce84a
```

**Tips: 可以使用 `echo Hello | hyper call helloworld` 附带 payload**

4. 切换回刚才查询 func logs 的终端窗口，会看到:

``` bash
$ hyper func logs helloworld
2017-02-10T04:05:26.704Z [CALL] RequestId: 7f713fff-a65c-4004-b195-72b0c7bce84a, ShortStdin:
2017-02-10T04:05:27.704Z [PENDING] RequestId: 7f713fff-a65c-4004-b195-72b0c7bce84a
2017-02-10T04:05:27.704Z [RUNNING] RequestId: 7f713fff-a65c-4004-b195-72b0c7bce84a
2017-02-10T04:05:27.704Z [COMPLETED] RequestId: 7f713fff-a65c-4004-b195-72b0c7bce84a, ShortStdout: Hello World
```

5. 使用步骤3获得的 Request ID，来获取这次 func call 的执行结果:

``` bash
$ hyper func get --wait 7f713fff-a65c-4004-b195-72b0c7bce84a
Hello World
```

6. 删除该 func:

``` bash
$ hyper func rm helloworld
helloworld
```

## Notes
* Func 有 func container quota 的限制，它是指同时处理 func call 的 container 的最大数量，可以在 [Account](https://console.hyper.sh/account/) 申请更多 quota。
* 当正在运行的 func call 数达到 func container quota 的限制时，新的 func call 会等待有空闲 quota 时才会继续执行。
* 每个 func 包含 50MB 已经 completed 的 func call 的 STDIN 与 STDOUT 的数据存储空间 (超过该大小时，最新数据会自动覆盖最旧数据)，当旧数据被覆盖后，你可能会获取不到相关的结果。未 completed 的 func call 的 stdin 不受此限制。
* 可以使用 `hyper func update --refresh $name` 命令重新为 func 生成新的 endpoint，适用于如 endpoint 被泄露的情况。
