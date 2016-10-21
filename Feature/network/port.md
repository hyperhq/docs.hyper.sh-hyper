# Port

If you've built any multi-container applications, chances are you've had to define some rules in order to manage ports. There are several ways to do this: 

- `--expose` flag at runtime
- `EXPOSE` instruction in the Dockerfile
- publish ports by using the `-p` or `-P` flags with `hyper run`

**The behavior of container port in Hyper.sh is very simpe**:

- All containers in the same network are inter-accessible; all ports are open within the network by default
- `-P` flag publishes all ports exposed by `--expose` flag at runtime, or `EXPOSE` instruction in the Dockerfile
- `-p` creates a port mapping rule like `-p hostPort:containerPort`. `containerPort` is required. If no `hostPort` is specified, Hyper.sh will use the same port as `containerPort`
