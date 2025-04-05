#Download base image ubuntu 16.04
FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

ARG UID
ARG GID
ARG USER

# Update repository
RUN apt update -y

# Install steam requirements
RUN apt install software-properties-common -y
RUN add-apt-repository multiverse

# Install arhitecture
RUN dpkg --add-architecture i386

RUN apt update -y

# Steamcmd bypass install
RUN echo steam steam/question select "I AGREE" | debconf-set-selections
RUN echo steam steam/license note '' | debconf-set-selections

# Install steamcmd
RUN apt install lib32gcc-s1 steamcmd -y

# Install basic
RUN apt install ansible wget tar unzip git vim python3-venv pip -y

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
