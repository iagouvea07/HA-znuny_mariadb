# HA znuny model
 A high availability infrastructure model of Znuny 7 with database replication


The infrastructure model consists of a high availability project which involves a Load Balancer model of the web application, where the files are shared on an NFS server that are used between the nodes.

In addition, availability through the load balancer was configured to be used in mariadb, where two master databases are used that replicate their data to a mirror bank where it will be configured to be used by Znuny only for queries, aiming at improving performance with the segregation of roles.


#Solutions used:

Docker - Used to simulate cases of several machines with containers, facilitating the deploy instead of virtualizing several machines

HAProxy - used for configuring the load balancer of web applications and master databases
