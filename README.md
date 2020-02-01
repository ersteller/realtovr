# realtovr
scan reality 

# Build
docker build -t ocvpy -f Dockerfile .

# Run windows
docker run -it -v ${pwd}:/host ocvpy /bin/bash

# Run Linux 
docker run -it -v $(pwd):/host ocvpy /bin/bash