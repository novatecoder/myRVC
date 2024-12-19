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

# Add the deadsnakes PPA to get Python 3.10
RUN add-apt-repository ppa:deadsnakes/ppa

# Install Python 3.10 and pip
RUN apt-get update && \
    apt-get install -y build-essential python3-pip python3.10-distutils python3-dev python3.10-dev python3.10 curl ffmpeg libsndfile1 && \
    apt-get clean

# Set Python 3.10 as the default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1

COPY ./requirements.txt .

RUN python -m pip install --break-system-packages --upgrade --ignore-installed pip setuptools wheel

RUN pip install --break-system-packages --no-cache-dir -r requirements.txt

# docker build -t myrcvdocker:latest .
