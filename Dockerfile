FROM --platform=$BUILDPLATFORM ghcr.io/planetary-server-manager/planetary-base:latest AS build
ARG TARGETOS
ARG TARGETARCH

LABEL maintainer="renegadespork"

# Get base libraries
RUN apt-get update
RUN apt-get install lib32gcc-s1 -y

# Create steam folders
RUN mkdir /steam

# Set up SteamCMD
RUN curl -L --max-redirs 1 "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" -o /steam/steamcmd_linux.tar.gz && \
    tar -xf /steam/steamcmd_linux.tar.gz -C /steam && \
    rm /steam/steamcmd_linux.tar.gz

# Fix Permissions
RUN chown -R ubuntu /steam

CMD ["/bin/bash", "/psm/info.sh"]