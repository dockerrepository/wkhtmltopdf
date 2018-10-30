echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker build --pull -t $IMAGE_NAME $DOCKER_BUILD_DIR
docker tag $IMAGE_NAME "$IMAGE_NAME-$VERSION"