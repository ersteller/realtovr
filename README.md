# realtovr
scan reality 

# Build
docker build -t realtovr -f Dockerfile .

# Run windows
docker run -it -v ${pwd}:/host realtovr /bin/bash

# Run Linux 
docker run -it -v $(pwd):/host realtovr /bin/bash