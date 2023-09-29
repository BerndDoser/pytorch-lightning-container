ARG CUDA_VERSION=11.8.0
ARG OS_VERSION=ubuntu22.04

FROM nvcr.io/nvidia/cuda:${CUDA_VERSION}-devel-${OS_VERSION}

LABEL maintainer="Bernd Doser <bernd.doser@h-its.org>"

RUN apt-get update \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt-get -y install --no-install-recommends \
       apt-transport-https \
       build-essential \
       ca-certificates \
       curl \
       dirmngr \
       ffmpeg \
       git \
       git-lfs \
       libsm6 \
       libxext6 \
       python3 \
       python3-dev \
       python3-pip \
       python3-venv \
       software-properties-common \
       sudo \
       vim \
       wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip

# COPY requirements.txt .
# RUN pip install -r requirements.txt
