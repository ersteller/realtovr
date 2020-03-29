FROM ubuntu:18.04

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

# we use python 3 now as default 
RUN ln -sf /usr/bin/python3.6 /usr/bin/python

# we need uptodate version of pip
RUN pip3 install --upgrade pip

# install numpy and tensorflow 
# pip install tensorflow==2.0.0 # or tensorflow-gpu==2.0.0
RUN pip3 install numpy && pip3 install tensorflow==2.0.0
# tensor flow should be installed now 

# now tensorflow dependancies standard image processing libraries including OpenCV:
RUN pip3 install opencv-contrib-python && pip3 install scikit-image && pip3 install pillow && pip3 install imutils 

# These image processing libraries will allow us to perform image I/O, various preprocessing techniques, as well as graphical display.
# From there, let’s install machine learning libraries and support libraries, the most notable two being scikit-learn and matplotlib:
RUN pip3 install scikit-learn && pip3 install matplotlib && pip3 install progressbar2 && pip3 install beautifulsoup4 && pip3 install pandas

## test x11 forwarding
# RUN apt-get install -y x11-apps
RUN pip3 install flask

ENV QT_X11_NO_MITSHM=1
LABEL Name=realtovr Version=0.0.1

# a little comfort
RUN echo "exit" >> ~/.bash_history

WORKDIR /host
CMD ["bin/bash"]
