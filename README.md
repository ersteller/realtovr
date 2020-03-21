# realtovr
this image containes opencv and tensorflow. i did this so i dont have to setup dependancies everytime i install something python related

### TODO:
for image outpu i use the local xserver 
this is not very practical on a windows machine where you would have to utilize either cygwins xwin or VcXsrv. maybe a webserver would be better and with less dependancies to the host machine. 


# Build
docker build -t realtovr -f Dockerfile .

# Run windows
docker run -it -v ${pwd}:/host realtovr /bin/bash

# run with local x11 
docker run -it \
    -e DISPLAY=$DISPLAY \
    -v $(pwd):/host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/root/.Xauthority:rw \
    realtovr /bin/bash
