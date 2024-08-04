# Get your host's UID and GID
# Make sure you running on something that isn't uid or GID that is 1000. It will error out.
export HOST_UID=$(id -u)
export HOST_GID=$(id -g)


# Build the Docker image
docker build --build-arg UID=$HOST_UID --build-arg GID=$HOST_GID -t minecraft .