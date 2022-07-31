FROM ubuntu:20.04

ARG GIT_NAME="Super Networks"
ARG GIT_EMAIL="git@example.com"
ARG DEBIAN_FRONTEND=noninteractive

ENV BOARD_CONFIG=2
ENV FORCE_UNSAFE_CONFIGURE=1
ENV TZ=America/Los_Angeles

RUN apt-get update && apt-get install -y build-essential git dosfstools e2fsprogs parted sudo mtools p7zip p7zip-full device-tree-compiler acpica-tools u-boot-tools e2tools qemu-system-arm libssl-dev cpio rsync bc bison flex python unzip wget squashfs-tools vim

RUN git config --global user.email "$GIT_EMAIL" && git config --global user.name "$GIT_NAME"

#RUN git clone git@github.com:SolidRun/cn913x_build.git /root/cn913x_build

# Assuming we're tagging and running the container with something like:
# docker build -t spr-fi/cn913x_build .
# docker run -it -v `pwd`:/root/cn913x_build spr-fi/cn913x_build bash
WORKDIR /root/cn913x_build
#ENTRYPOINT /root/cn913x_build/runme.sh
ENTRYPOINT /bin/bash
