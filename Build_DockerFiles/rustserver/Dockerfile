#Download base image ubuntu 16.04
FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

ARG UID
ARG GID

# Update repository
RUN apt update -y

# Install arhitecture
RUN dpkg --add-architecture i386

# Install basic
RUN apt install ansible wget tar unzip git openjdk-17-jre python3.11 vim netcat lib32gcc1 lib32stdc++6 steamcmd lib32z1 -y

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