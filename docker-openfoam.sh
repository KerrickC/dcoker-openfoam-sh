#!/bin/sh

readonly DOCKER_VERSION="$(sudo docker --version)"
echo "$DOCKER_VERSION"

#pull image from docker-hub
sudo docker pull openfoam/openfoam7-paraview56

#format image to get ID and assign to OPENFOAM_IMAGE_ID 
readonly OPENFOAM_IMAGE_ID="$(sudo docker images --format "{{.ID}}" openfoam/openfoam7-paraview56)"

#run image
echo "Image ID: $OPENFOAM_IMAGE_ID"
readonly OPENFOAM_CONTAINER_NAME="my_container"
sudo docker container run -it -u 0 --rm -d --name="$OPENFOAM_CONTAINER_NAME" "$OPENFOAM_IMAGE_ID" bash

#echo exec to ensure internal exec commands are working
sudo docker exec -i "$OPENFOAM_CONTAINER_NAME" echo "Connected to container successfully! Running simulation..."

#define env vars, run sim and exit
sudo docker exec -it -e WM_PROJECT_DIR="/opt/openfoam7" my_container bash -c "/opt/openfoam7/tutorials/incompressible/simpleFoam/rotorDisk/Allclean && /opt/openfoam7/tutorials/incompressible/simpleFoam/rotorDisk/Allrun"

#stop container
sudo docker container stop my_container