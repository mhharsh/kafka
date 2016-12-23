This repository configures two zookeeper containers and two kafka containers .The metrices are managed by Burrow for kafka and zookeeper .Burrow is configured as docker container .

The whole setup is build on the following versions:

ansible version:2.2.0.0
docker version: Docker version 1.12.3, build 6b644ec

The entry point for the script is run.sh located in the main directory .

Execute : `sh run.sh` to get the environment up and running.



To configure the notification ,edit the burrow.cfg.j2 smtp section.
This will send notifications for any critical issues in the cluster.
```[smtp]
server=<smtp.server@example.com>
port=<smt port>
auth-type=plain
username=<abc.example.com>
password=********
from=burrow-noreply@example.com
template=config/default-email.tmpl

[emailnotifier "<abc.example.com>"]
group=local,critical-consumer-group
group=local,other-consumer-group
interval=60
enable=true
```

After the installation the burrow api's can be used to find the kafka cluster 
status .
'http://localhost:3000/v2/kafka'

References for kafka and zookeper configuration :
https://www.confluent.io/blog/how-we-monitor-and-run-kafka-at-scale-signalfx/

References for Burrow installation and configuration:
https://community.hortonworks.com/articles/28103/monitoring-kafka-with-burrow.html

https://community.hortonworks.com/articles/33834/monitoring-kafka-with-burrow-part-2.html
