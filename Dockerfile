ARG BASE_IMAGE=almalinux:9
FROM $BASE_IMAGE
LABEL maintainer="anna.zaborowska@cern.ch"

#labels
LABEL org.label-schema.name="zaborowska/key4hepX"
LABEL org.label-schema.description="Key4hep dev with X Docker image"
LABEL org.label-schema.url="https://github.com/zaborowska/docker-key4hepX"
LABEL org.label-schema.docker.cmd="docker build -t zaborowska/key4hepX:latest --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') --no-cache=true ."

WORKDIR /workspace

RUN dnf update -y && \
    dnf install -y "@base-x" && \
    dnf install -y git make cmake gcc-c++ gcc binutils emacs mesa-libGLU mesa-libGLw libglvnd-opengl

COPY bashrc /etc/profile.d/custom.sh

ENTRYPOINT  ["/usr/bin/bash", "-l", "-c"]
