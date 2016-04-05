# Install CLI

Hyper\_ currently provides official CLI builds for Linux and Mac. Windows release will be soon.

- Linux x86_64
- Mac OS X 10.7 (lion) or later
- Windows (Coming soon)

## Install on Linux

    $ wget https://hyper-install.s3.amazonaws.com/hyper-1.10-x86_64.tar.gz
    $ tar xzf hyper-1.10-x86_64.tar.gz
    $ chmod +x hyper
    $ ./hyper --help

## Install on Mac

    $ curl -O https://mirror-hyper-install.s3.amazonaws.com/hyper-1.10-mac.bin.zip
    $ unzip hyper-1.10-mac.bin.zip 
    $ ./hyper --help

## CLI Configuration

Once the installation completes, enter `hyper config` in your terminal. The CLI will prompt to ask for your API credential:

![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/720x143/9fdd9a68694376d4ec62a3d93409e67c/upload_3_18_2016_at_6_11_19_PM.png)

The credential is stored in a local configuration file `$HOME/.hyper/config.json`. The configuration file is similar to Docker's, with an extra section `clouds`.

![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/635x160/c9caa016982d5884eb06578292c154bf/config.png)
