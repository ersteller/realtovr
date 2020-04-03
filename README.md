# realtovr
this image containes opencv and tensorflow. I did this so i dont have to setup dependencies everytime i install something python related

### TODO:
For image output i currently use the local xserver 
this is not very practical on a windows machine where you would have to utilize either cygwins xwin or VcXsrv. Maybe a webserver would be better and with less dependancies to the host machine. So there is a python webserver that shows the images in ./static. you can overwrite the images in the scripts and reloat the website.

# Docker Repository
https://hub.docker.com/r/ersteller/realtovr

# Build
```docker build -t realtovr -f Dockerfile . ```

# Run Linux webserver and bash
```docker run -it -p 80:80 -v $(pwd):/host realtovr /bin/bash -c "python src/srv.py & /bin/bash"```

# Run windows
```docker run -it -v ${pwd}:/host realtovr /bin/bash```

# run with local x11 
```
docker run -it \
    -e DISPLAY=$DISPLAY \
    -v $(pwd):/host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/root/.Xauthority:rw \
    realtovr /bin/bash
```