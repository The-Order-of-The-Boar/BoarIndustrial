from ubuntu:22.04

ENV TZ=America/Araguaina
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/time

RUN apt-get -y update && apt-get -y upgrade

# C++ dependencies
RUN apt-get -y install build-essential cmake

# VCPKG dependencies 
RUN apt-get -y install git curl zip unzip tar pkg-config

# Libraries
RUN apt-get -y install libsdl2-dev libsdl2-image-dev
