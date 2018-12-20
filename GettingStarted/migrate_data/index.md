# Migrate data

There are two ways to migrate data to external storage.

If you have your own public file server or cloud storage:
  - Install and config the command line tool in hyper container
  - Copy files from hyper container to external file server or cloud storage with cli

[Detail](./use_hyper_container_as_client/index.md)

If you don't have your own file server:
  - Run a file server container in hyper.sh(with data volumes mounted, and a FIP was attached)
  - Download files from this hyper container

[Detail](./use_hyper_container_as_server/index.md)
