#!/bin/sh

IMAGE=$1
VERSION=$2
DOCKER_ID=`docker run \
  -link memcache:mc \
  -v /tmp/log/app:/var/log/app:rw \
  -p 3000 \
  -d \
  $IMAGE:$VERSION`

PORT=`sudo docker inspect $DOCKER_ID | grep HostPort | cut -d '"' -f 4 | head -1`

cat >/etc/nginx/conf.d/app_containers.conf <<EOL
upstream app_containers {
  server 127.0.0.1:${PORT};
}
EOL

echo "Version:\t$IMAGE:$VERSION\nId:\t\t$DOCKER_ID\nPort:\t\t$PORT"
