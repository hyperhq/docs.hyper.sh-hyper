## login

    Usage: hyper login [OPTIONS] [SERVER]

    Make Hyper to log in to a Docker registry server, if no server is
	specified "https://index.docker.io/v1/" is the default.

      -e, --email=""       Email
      --help=false         Print usage
      -p, --password=""    Password
      -u, --username=""    Username

You can log into any public and private repository for which you have credentials and accessible over Internet.  When you log in, the command stores encoded credentials in `$HOME/.hyper/config.json` on Linux.

> **Note**:  When running `sudo hyper login` credentials are saved in `/root/.hyper/config.json`.
>
