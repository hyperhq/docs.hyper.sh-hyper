## config

    Usage: hyper config [OPTIONS]

    Cloud user's access key and secret key.

        --accesskey        Access Key
        --help             Print usage
        --secretkey        Secret Key
        --default-region   Default Region

You can config the Hyper.sh account's access key, secret key and default region.  When you did config, the command stores encoded credentials in `$HOME/.hyper/config.json` on Linux/Mac.

> **Note**:  When running `sudo hyper config` credentials are saved in `/root/.hyper/config.json`.
>
