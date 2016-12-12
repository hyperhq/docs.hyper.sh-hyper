# Logs

1. How to access the container logs?
> To retrieve the logs, use either [`hyper logs`](https://docs.hyper.sh/Reference/CLI/logs.html) command or [`logs`](https://docs.hyper.sh/Reference/API/2016-04-04%20[Ver.%201.23]/Container/logs.html) API.

2. Is the log available after the container is stopped or removed?
> In Hyper.sh, container logs are available within the lifespan of the container. You can access logs when the container is stopped, but not if it is removed.

3. What is the max log size?
> We keep the latest logs (up to 50MB) for every container. Rotation occurs upon 50MB.

4. What happens to the logs if the container gets restarted?
> When a container gets restarted (or stopped / started), the previous logs are kept and new logs will be appended. 

5. Can I forward the logs to external log service?
> This is in our [roadmap](https://trello.com/c/VwHHeVHm/60-integration-with-logstash). You are welcome to comment. That will help us a lot to understand the requirements. Thanks!
