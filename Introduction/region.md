# Regions

Each Hyper region is designed to be completely isolated from the other Hyper regions. This achieves the greatest possible fault tolerance and stability.

When you view your resources, you'll only see the resources tied to the region you've specified. This is because regions are isolated from each other, and we don't replicate resources across regions automatically.

The following table lists the regions provided by Hyper.sh
|Region|Location|
|---|---|
|us-west-1 | Los Angels |
|eu-1 | EU |

### Specify Your Regions
1. Use the command option --region

```
hyper --region us-west-1
```

2. Set default region in config file

```
{
  "auths": {},
  "clouds": {
    "tcp://us-west-1.hyper.sh:443": {
      "accesskey": "XXX",
      "secretkey": "XXX",
      "region: "us-west-1"
    }
  }
}
```
