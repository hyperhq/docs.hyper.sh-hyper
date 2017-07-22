# Filter

In the web console, you can create filters to manage resources. Currently the following resources are supported:

> - Container

Filter is dynamic, e.g. new resources matched with the filter will be automatically selected, and decommissioned resources are auto-removed.

### Filter Sytax
The filter syntax is resource specfic. More details can be found at:

> - Container (The part of [ps filters](https://docs.hyper.sh/Reference/CLI/ps.html))
> 	- id (container's id)
> 	- label (`label=<key>` or `label=<key>=<value>`)
> 	- name (container's name or a substring in the name)
> 	- image (container's image name)

The same filter expression attribute will be treated as a union, different attributes will be as an intersection.

### Create a filter
- Login to [the web console](https://console.hyper.sh)
- Goto the resource page e.g. container
- Enter the criteria in the filter area
- Click `Save`
- Enter a new name, or replace an existing filter

### Edit a filter
- Login to [the web console](https://console.hyper.sh)
- Goto the resource page e.g. container
- Click `Filter` and select the filter you want to edit
- Edit the criteria in the filter area
- Click `Save`

### Set action
Once a filter is created, you can set up actions on it:

- Login to [the web console](https://console.hyper.sh)
- Goto the `Resource Filters` page
- Select (or unselect) actions for filters
 
Actions are resource specific. Currently the following actions are supported:

> - Container
> 	- Send email notification on (unexpected) container exit

# Action Reference

### Send email notification on (unexpected) container exit
An email notification will be sent to your registered email address if a container exits unexpectedly:

- User-triggered container stops (CLI and API) are NOT included
- Normal container exit are NOT included (exit code 0), e.g. job finished
- Notification threshold is 5 minutes. All container exit events during this period will be put in one email
- The notification email will include container id, name, exit code and time
- If your container repeatedly restarts (with `--restart=always` flag), only one notification will be sent within a 5 minute window
- If the container exit is caused by a platform incident, we will send the notification email as soon as possible

# Limits

- The maximum length of filter name is 255
- The maximum number of filters is 50
