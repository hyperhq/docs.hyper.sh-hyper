## volume init

    Usage:  hyper volume init [OPTIONS] SOURCE:VOLUME [SOURCE:VOLUME...]

    Initialize a volume

      --help=false       Print usage

Initialize one or more volumes. You cannot initialize a volume that is in use by a container.
Supported SOURCE includes http/https destination and git repository in public domain, and also local
files and directories with absolute path. A volume can be initialized only once.

#### Examples

**init a volume from public https URL:**

    $ hyper volume init https://raw.githubusercontent.com/hyperhq/hypercli/master/README.md:volume_foo

**init a volume from public git repository:**

    $ hyper volume init git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git:volume_foo

**init a volume from a local directory:**

    $ hyper volume init /opt/:volume_bar

**init a volume from a local directory:**

    $ hyper volume init /etc/vimrc:volume_bar
