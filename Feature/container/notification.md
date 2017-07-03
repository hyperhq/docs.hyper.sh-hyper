# Group

In Hyper.sh, you can group some resources, and set up event notification for the group. currently we support grouping for container, you can use the filter expression in the [console page](https://console.hyper.sh/containers) to filter out the related containers and save them as a group. The filter expression can be written:

```
- id=<container id>
- name=<container name>
- image=<image name>
- label=<key>=<value>
```

The same filter attribute will be as union, different filter attributes will be as intersection.

# Notification

Once save the contianers filtered out as a group, you can set up event notification in the [console page](https://console.hyper.sh/groups). currently we support enabling container stop notification. Hyper.sh will notify via email when container automatically stop:

- Including all stop events which is non-user operations (CLI and API is user operation).
- The notification threshold is 5 minutes, the email will include a list of all stop events during that time.
- The notification email will include container id, name, exit code and time.
- If your container repeatedly restart, we will only send one notification email within 5 minutes.
- If the container stop is caused by hyper.sh service problem, we will send the notification email as soon as possible.
