# Install CLI

Hyper\_ currently provides official CLI builds for Linux and Mac. Windows release will be soon.

- Linux 64 bit
- Mac 10.7 (lion) or later
- Windows (Coming soon)

## Install on Linux

    curl -sSL https://hyper.sh/install | bash

Don't like the "curl to bash" methods? Download tarballs [TODO: here]().

## Install on Mac
~~TODO~~

## CLI Configuration

Once the installation completes, enter `hyper config` in your terminal. The CLI will prompt to ask for your credential:


![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/600x119/9fae270300cee6068785e666c0d350a7/upload_3_18_2016_at_6_11_19_PM.png)

The command saves your credential in a local configuration file `$HOME/.hyper/config.json`.

![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/768x286/b1e21c3752ac5479e625383ab94ac56a/pasted_image_at_2016_03_18_05_19_pm.png)
![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/768x286/b1e21c3752ac5479e625383ab94ac56a/pasted_image_at_2016_03_18_05_19_pm.png)
The configuration file is similar to Docker's, with an extra section `clouds`.
