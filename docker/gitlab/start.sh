HOST_NAME=127.0.0.1
GITLAB_DIR=/Volumes/data/wnz/mydev/IdeaProjects/notebook/docker/gitlab/data
CONTAINER_NAME=gitlab

#docker stop $CONTAINER_NAME
#docker rm $CONTAINER_NAME
docker run -d \
  --hostname $HOST_NAME \
  -p 8443:443 -p 10080:80 -p 2222:22 \
  --name $CONTAINER_NAME \
  --restart always \
  -v $GITLAB_DIR/config:/etc/gitlab \
  -v $GITLAB_DIR/logs:/var/log/gitlab \
  -v $GITLAB_DIR/data:/var/opt/gitlab \
  gitlab/gitlab-ee:latest
