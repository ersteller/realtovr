# realtovr
scan reality 

# Build
docker build -t realtovr -f Dockerfile .

# Run windows
docker run -it -v ${pwd}:/host realtovr /bin/bash

# Run Linux 
docker run -it -v $(pwd):/host --env="DISPLAY" --net=host --volume="$HOME/.Xauthority:/root/.Xauthority:rw" realtovr /bin/bash 

# run with local x11 
xhost +local: && \
    docker run -it \
    -e DISPLAY=$DISPLAY \
    -v $(pwd):/host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/root/.Xauthority:rw \
    realtovr /bin/bash
