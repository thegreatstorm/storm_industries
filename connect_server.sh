echo "Connect to a container!"
user=$(whoami)
docker ps -a
read -p "Enter ContainerID/Name: " container_info
docker exec -u $user -it $container_info /bin/bash
