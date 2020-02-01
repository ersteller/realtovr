# realtovr
scan reality 

# Build
docker build -t ocvpy -f Dockerfile .

# Run
docker run -it -v ${pwd}:/host ocvpy /bin/bash