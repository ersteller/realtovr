# Python support can be specified down to the minor or micro version
# (e.g. 3.6 or 3.6.3).
# OS Support also exists for jessie & stretch (slim and full).
# See https://hub.docker.com/r/library/python/ for all supported Python
# tags from Docker Hub.
#FROM python:alpine

# If you prefer miniconda:
#FROM continuumio/miniconda3
#FROM victorhcm/opencv:3.2.0-python2.7 as base
FROM ubuntu:18.04

#  docker run --name <CONTAINER_NAME> -it -v $(pwd):/host victorhcm/opencv /bin/bash

# How to Install tensor flow
#https://www.pyimagesearch.com/2019/12/09/how-to-install-tensorflow-2-0-on-ubuntu/

RUN apt-get update && \
    apt-get install -y build-essential cmake unzip pkg-config gcc-6 g++-6

# From there we’ll install X windows libraries and OpenGL libraries:
RUN apt-get install -y libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev

# Along with image and video I/O libraries:
RUN apt-get install -y libjpeg-dev libpng-dev libtiff-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libxvidcore-dev libx264-dev

# Next, we’ll install optimization libraries:
RUN apt-get install -y libopenblas-dev libatlas-base-dev liblapack-dev gfortran

# And HDF5 for working with large datasets:	
RUN apt-get install -y libhdf5-serial-dev

# We also need our Python 3 development libraries including TK and GTK GUI support:
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get install -y python3-dev python3-tk python-imaging-tk libgtk-3-dev python3-pip

# install numpy and tensorflow 
RUN pip3 install numpy && pip3 install tensorflow

# now tensorflow dependancies 
RUN pip3 install opencv-contrib-python && pip3 install scikit-image && pip3 install pillow && pip3 install imutils 

# Tese image processing libraries will allow us to perform image I/O, various preprocessing techniques, as well as graphical display.
# From there, let’s install machine learning libraries and support libraries, the most notable two being scikit-learn and matplotlib:
RUN pip3 install scikit-learn && pip3 install matplotlib && pip3 install progressbar2 && pip3 install beautifulsoup4 && pip3 install pandas


## test tensorflow python -c "import tensorflow as tf;print(tf.__version__); import tensorflow.keras cv2;print(cv2.__version__);"
### should be 2.0.0 and  4.1.2 at least


LABEL Name=realtovr Version=0.0.1

# Using pip:
#RUN python3 -m pip install -r requirements.txt
WORKDIR /host
CMD ["bin/bash"]

# Using pipenv:
#RUN python3 -m pip install pipenv
#RUN pipenv install --ignore-pipfile
#CMD ["pipenv", "run", "python3", "-m", "realtovr"]

# Using miniconda (make sure to replace 'myenv' w/ your environment name):
#RUN conda env create -f environment.yml
#CMD /bin/bash -c "source activate myenv && python3 -m realtovr"
