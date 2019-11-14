#!/bin/bash

export DOCKER_IMAGE=exam:1

if [[ "$(docker images -q $DOCKER_IMAGE 2> /dev/null)" == "" ]]; then
  docker build . --tag $DOCKER_IMAGE
fi
# Specify folder where you can find sources , on your local machine
export SOURCE_FOLDER="$HOME/.ssh"
# Specify destination folder to mount your project into docker
export DEST_FOLDER="/home/student/.ssh"

export GIT_CONFIG_SRC="$HOME/.gitconfig"
export GIT_CONFIG_DEST="/home/student/.gitconfig"
docker run --rm -v "$GIT_CONFIG_SRC:$GIT_CONFIG_DEST" -v "$SOURCE_FOLDER:$DEST_FOLDER" -it $DOCKER_IMAGE /bin/bash -c "git clone https://github.com/Epitech-Barcelona/exam_tek1.git && mv exam_tek1 /home/student/subject && su - student"
