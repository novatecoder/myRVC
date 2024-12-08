FROM nvidia/cuda:12.6.3-cudnn-devel-ubuntu24.04

EXPOSE 7865

WORKDIR /APP

# export DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Install dependenceis to add PPAs
RUN apt-get update && \
    apt-get install -y -qq ffmpeg aria2 && apt clean && \
    apt-get install -y software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add the deadsnakes PPA to get Python 3.12
RUN add-apt-repository ppa:deadsnakes/ppa

# Install Python 3.12 and pip
RUN apt-get update && \
    apt-get install -y build-essential python-dev python3-dev python3.12-distutils python3.12-dev python3.12 curl && \
    apt-get clean && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 1 && \
    curl https://bootstrap.pypa.io/get-pip.py | python3.12

# Set Python 3.12 as the default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.12 1

RUN python3 -m pip install --upgrade pip==24.0
RUN python3 -m pip install --no-cache-dir -r requirements.txt