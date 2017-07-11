# Filter

In the web console, you can create filter to manage resource. Currently the following resources are supported:

> - Container

Filter is dynamic, e.g. new resources matched with the filter will be automatically selected, and decommissioned resources are auto-removed.

### Filter Sytax
The filter syntax is resource specfic. More details can be found at:

> - Container (The part of [ps filters](https://docs.hyper.sh/Reference/CLI/ps.html))
> 	- id (container's id)
>  	- label (label=<key> or label=<key>=<value>)
> 	- name (container's name)
> 	- image (container's image)

The same filter expression attribute will be as a union, different will be as an intersection.

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
- Select (unselect) actions for filters
 
Action is resource specific. Currently the following actions are supported:

> - Container
> 	- Send email notification on container (unexpected) exit

# Action Reference

### Send email notification on container (unexpected) exit
An email notification will be sent your registered email address if a container exited unexpectedly:

- User-trigger container stop (CLI and API) are NOT included
- Normal container exit are NOT included (exit code should be 0), e.g. job finished
- Notification threshold is 5 minutes. All container exit events during this period will be put in one email
- The notification email will include container id, name, exit code and time.
- If your container repeatedly restarts (with `--restart=always` flag), only one notification will be sent within 5 minutes
- If the container exit is caused by the platform incident, we will send the notification email as soon as possible
