# Install CLI

Hyper currently provides official CLI builds for Linux and Mac.

- Linux x86
- Mac OS X 10.7 (lion) or later
- Windows (Beta)
- Linux ARM (Beta)

> **Please note**
The hyper client will attempt to update itself to the latest version once per day automatically. If you don't want to wait for the next daily cycle, just remove ~/.hyper/cktime.json, and the check will occur immediately.

## Install on Mac

    $ curl -O https://hyper-install.s3.amazonaws.com/hyper-mac.bin.zip
    $ unzip hyper-mac.bin.zip 
    $ ./hyper --help

or

    $ brew install hyper


## Install on Linux x86

    $ wget https://hyper-install.s3.amazonaws.com/hyper-linux-x86_64.tar.gz
    $ tar xzf hyper-linux-x86_64.tar.gz
    $ ./hyper --help

## Install on Windows (Beta)
    - Download package from https://hyper-install.s3.amazonaws.com/hyper-win64.zip
    - Unzip this package
    - Open Windows Command Prompt and run .\hyper.exe --help
> Note: this package on Windows is beta version, please file a bug at [here](https://github.com/hyperhq/hypercli/issues) if you find any issue.

## Install on Linux ARM (Beta)

    $ wget https://hyper-install.s3.amazonaws.com/hyper-arm.tar.gz
    $ tar xzf hyper-arm.tar.gz
    $ ./hyper --help



## CLI Configuration

Once the installation completes, enter `hyper config` in your terminal and the CLI will prompt you for your API credential:

![](https://user-images.githubusercontent.com/1132167/29712961-f2680432-89ce-11e7-984d-88ae35a3803c.jpg)

The credential is stored in a local configuration file `$HOME/.hyper/config.json`. The configuration file is similar to Docker's, with an extra section `clouds`.

![](https://user-images.githubusercontent.com/1132167/29712962-f26d343e-89ce-11e7-81d5-1f68e1eb688e.jpg)

Or you can use environment vairables `HYPER_ACCESS` and `HYPER_SECRET` to pass the access key and secret key to the CLI which will search for these environment variables _before_ loading the configuration file.
