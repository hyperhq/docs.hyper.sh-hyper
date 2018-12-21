# Migrate data

There are two ways to migrate data to external storage.

If you have your own public file server or cloud storage:
  - Install and config the command line tool in your running hyper container
  - Upload volume data from the hyper container to your own server or cloud storage with cli

[Instructions](./use_hyper_container_as_client/index.md)


If you don't have your own file server and cloud storage:
  - Run a file server container in hyper.sh(with data volumes mounted, and a FIP was attached)
  - Download volume data from the hyper container to your localhost

[Instructions](./use_hyper_container_as_server/index.md)
