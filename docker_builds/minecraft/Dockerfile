#Download base image ubuntu 16.04
FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

ARG UID
ARG GID
ARG USER

# Update repository
RUN apt update -y

# Install arhitecture
RUN dpkg --add-architecture i386

# Ansible workaround
RUN apt-add-repository ppa:ansible/ansible

RUN apt update -y

# Install basic
RUN apt install ansible wget tar unzip git openjdk-17-jre openjdk-21-jre python3 python3-venv vim pip -y

# Update the package list, install sudo, create a non-root user, and grant password-less sudo permissions
RUN apt update && \
    apt install -y sudo && \
    addgroup --gid $GID $USER && \
    adduser --uid $UID --gid $GID --disabled-password --gecos "" $USER && \
    echo 'nonroot ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Set the non-root user as the default user
USER $USER
RUN mkdir -p /home/$USER/server/venv
RUN python3 -m venv /home/$USER/venv


# Set the working directory
WORKDIR /home/$USER/server

# Copy files into the container and set the appropriate permissions
COPY --chown=$USER:$USER . /home/$USER/server
RUN chmod -R 755 /home/$USER/server