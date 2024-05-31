## KiCad Docker Image

This Docker image is based on Ubuntu 24.04 and includes the installation of KiCad 8.0. It is configured to run KiCad in a container with the ability to display its graphical interface on your host's Xserver.

### Features

- Based on **Ubuntu 24.04**
- Includes **KiCad 8.0**
- Configured to run KiCad with GUI support on host's Xserver
- Mounts project directory from host to container for seamless file access

### Usage

To build the Docker image:

```bash
docker build -t kicad_image .
```

To run KiCad in a container with GUI support:

```bash
docker run --rm -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /home/$USER/Projekt:/home/kicad/Projekt \
    --user kicad \
    --name kicad_container kicad_image
```

### Explanation

- `--rm`: Automatically removes the container when it exits.
- `-e DISPLAY=$DISPLAY`: Sets the DISPLAY environment variable to forward the graphical output to your host's Xserver.
- `-v /tmp/.X11-unix:/tmp/.X11-unix`: Mounts the X11 socket directory to allow communication with the Xserver.
- `-v /home/$USER/Projekt:/home/kicad/Projekt`: Mounts your project directory from the host to the container.
- `--user kicad`: Runs the container as the `kicad` user to ensure proper permissions.
- `--name kicad_container`: Assigns a name to the running container (optional).
- `kicad_image`: The name of the Docker image.

### Additional Information

This image ensures that KiCad is ready to use out of the box with all necessary dependencies and configurations. It is ideal for users who want to run KiCad in a contained environment without installing it directly on their host system.

