hadoopstack-hadoop-cookbook
===========================

A wrapper cookbook of hadoop-cookbook containing HadoopStack specific
changes.

It assumes that each cluster node is assigned a chef node-name in the
following format.

```
<cluster_id>-<role>-<number>
```

Using search() resource, we enable autodiscovery of services. 
e.g. - slave nodes use "<cluster_id>-master*" regex to search for
master node of its cluster and use its IP address in their conf file.