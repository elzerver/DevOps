#!/bin/bash

# Data output example
# echo "Error response from daemon: conflict: unable to delete 838f3ec33df2 (cannot be forced) - image is being used by running container 621d23bd704f")
# The first step is store the values of the actual running container
DELETE_IMAGE=$(docker images | grep latest | grep amazonaws | awk -F' ' '{print $3}')
CONTAINER_STOP=$(docker ps | awk -F' ' '{print $1}'| grep -v CONTAINER)
CONTAINER_RM=$CONTAINER_STOP
STATUS=$CONTAINER_STOP

if [ "$CONTAINER_STOP" = "" ]; then
   echo "There's no container running"
     docker run -d  -p 80:3000 763312739895.dkr.ecr.us-east-1.amazonaws.com/boletia_admin_web:latest
else

   echo "Stoping the container"
     docker stop $CONTAINER_STOP
   echo " The container is stopped"

   echo " Deleting the container"
     docker rm $CONTAINER_RM
   echo "The container is deleted"

   echo "Deleting the image"
     docker rmi $DELETE_IMAGE
   echo "The image is deleted"

   echo "Running the container"
     docker run -d  -p 80:3000 763312739895.dkr.ecr.us-east-1.amazonaws.com/boletia_admin_web:latest
   echo "The container is up and running !!!"

fi
