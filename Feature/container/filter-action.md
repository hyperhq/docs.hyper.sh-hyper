# Resource Filter

In Hyper.sh, you can create a filter to group resources with the same attributes, and then set actions for these resources. currently the filter support container, you can use the filter expression in the [console page](https://console.hyper.sh/containers) to find out the related containers and save the filter. The filter expression can be written:

```
- id=<container id>
- name=<container name>
- image=<image name>
- label=<key>=<value>
```

The same filter expression attribute will be as union, different will be as intersection.

# Action: Notification

Once you saved a filter, you can set up some actions on the filer. currently we support enabling container stop notification action in the [console page](https://console.hyper.sh/filters). Hyper.sh will notify via email when container automatically stop:

- Including all stop events which is non-user operations (CLI and API is user operation).
- The notification threshold is 5 minutes, the email will include a list of all stop events during that time.
- The notification email will include container id, name, exit code and time.
- If your container repeatedly restart, we will only send one notification email within 5 minutes.
- If the container stop is caused by hyper.sh service problem, we will send the notification email as soon as possible.
