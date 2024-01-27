#Download base image ubuntu 16.04
FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

ARG UID
ARG GID

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
RUN apt install ansible wget tar unzip git python3.11 vim netcat pip -y


# Update the package list, install sudo, create a non-root user, and grant password-less sudo permissions
RUN apt update && \
    apt install -y sudo && \
    addgroup --gid $GID gameadmin && \
    adduser --uid $UID --gid $GID --disabled-password --gecos "" gameadmin && \
    echo 'nonroot ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Set the non-root user as the default user
USER gameadmin

# Set the working directory
WORKDIR /home/gameadmin/server

# Copy files into the container and set the appropriate permissions
COPY --chown=gameadmin:gameadmin . /home/gameadmin/server
RUN chmod -R 755 /home/gameadmin/server
RUN touch /home/gameadmin/.bashrc
RUN mkdir -p /home/gameadmin/.steam/sdk64/
RUN steamcmd +login anonymous +app_update 1007 +quit
RUN cp /home/gameadmin/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so /home/gameadmin/.steam/sdk64/
RUN echo "alias steamcmd=\"/usr/games/steamcmd\"" >> /home/gameadmin/.bashrc