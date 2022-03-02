
# READ ME : run this command to make the script executable
# $ chmod u+x run_docker.sh

# IMPORTANT POINT : it can only load images with "*.jpg" file extension.

# Build the docker
docker build --pull --rm -f "Dockerfile" -t gimp-labeler:latest "."
# Make the shared folder in which the data is located
mkdir -p ./data
# Run the docker
xhost + && \
docker run --rm -it --init \
    --ipc=host --env="DISPLAY" \
    -v $HOME/.Xauthority:/root/.Xauthority \
    --volume="$PWD/data:/data" \
    --privileged --net=host  gimp-labeler:latest &&
xhost - 