# Use the official Ubuntu 24.04 image as a base
FROM ubuntu:24.04

# Set environment variables to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages and KiCad
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository --yes ppa:kicad/kicad-8.0-releases && \
    apt-get update && \
    apt-get install --install-recommends -y kicad && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a user for running KiCad
RUN useradd -ms /bin/bash kicad

# Create the project directory and set appropriate permissions
RUN mkdir -p /home/kicad/Projekt && chown -R kicad:kicad /home/kicad/Projekt

# Switch to the kicad user
USER kicad
WORKDIR /home/kicad

# Set the entrypoint to start KiCad
ENTRYPOINT ["/usr/bin/kicad"]

