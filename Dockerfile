FROM fedora:30
LABEL maintainer="Maxime JENNY <maxime.jenny@epitech.eu>"

COPY . /tmp/scripts

ENV TERM xterm-256color

RUN cd /tmp/scripts && ./install_packages_dump.sh

RUN useradd student

RUN chown student.student /home/student
