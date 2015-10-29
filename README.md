# nsqd on ECS

One weird trick to get your nsqd container running on Elastic Container Service.

1. Create an environment file on your host with NSQD_BROADCAST_ADDRESS=[your ip], e.g. /usr/share/ecs/environment
2. Mount the directory read-only in your task definition at /etc/nsqd in the container
3. Run as usual leaving off the -broadcast-address flag
