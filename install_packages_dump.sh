#!/usr/bin/sh

clear
echo "INSTALLING PACKAGES FOR EPITECH'S DUMP"
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
cat /etc/fedora-release | grep "Fedora release 30"
if [[ $? -ne 0 ]]; then
    echo "This script must be run onto a Fedora 30";
    exit 1
fi
echo "Press ENTER to continue..."
read

dnf -y install dnf-plugins-core && dnf -y copr enable petersen/stack2 && dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

packages_list=(boost-devel.x86_64
	       boost-static.x86_64
	       ca-certificates.noarch
	       clang.x86_64
	       cmake.x86_64
	       CUnit-devel.x86_64
	       curl.x86_64
	       flac-devel.x86_64
	       freetype-devel.x86_64
	       gcc.x86_64
	       gcc-c++.x86_64
	       gdb.x86_64
	       git
	       glibc.x86_64
	       glibc-devel.x86_64
	       glibc-locale-source.x86_64
	       gmp-devel.x86_64
	       ksh.x86_64
	       elfutils-libelf-devel.x86_64
	       libjpeg-turbo-devel.x86_64
	       libvorbis-devel.x86_64
	       libX11-devel.x86_64
	       libXext-devel.x86_64
	       ltrace.x86_64
	       make.x86_64
	       nasm.x86_64
	       ncurses.x86_64
	       ncurses-devel.x86_64
	       net-tools.x86_64
	       ocaml.x86_64
	       ocaml-camlp4.x86_64
	       openal-soft-devel.x86_64
	       python3-curses_ex.x86_64
	       python3-numpy.x86_64
	       python2-numpy.x86_64
	       python3.x86_64
	       rlwrap.x86_64
	       ruby.x86_64
	       strace.x86_64
	       tar.x86_64
	       tcsh.x86_64
	       tmux.x86_64
	       sudo.x86_64
	       tree.x86_64
	       unzip.x86_64
	       valgrind.x86_64
	       vim
	       emacs-nox
	       which.x86_64
	       xcb-util-image.x86_64
	       xcb-util-image-devel.x86_64
	       zip.x86_64
	       zsh.x86_64
	       avr-gcc.x86_64
	       avr-gdb.x86_64
	       docker
	       docker-compose
	       ncurses
	       ncurses-libs
	       ncurses-devel
	       java-openjdk
	       java-openjdk-devel
	       ocaml
	       ocaml-SDL
	       boost
	       boost-math
	       boost-graph
	       umbrello
	       valgrind
	       net-tools
	       autoconf
	       automake
	       tcpdump
	       wireshark
	       nodejs
	       python2-virtualenv-api
	       python3-virtualenv-api
	       python2-virtualenv
	       python3-virtualenv
	       qemu
	       emacs-tuareg
	       libvirt
	       libvirt-devel
	       virt-install
	       systemd-devel
	       libgudev-devel
	       stack
	       ghc
	       cargo
               x264
               lightspark
               lightspark-mozilla-plugin)

dnf -y install ${packages_list[@]}

# BLIH
cp ./blih.py /usr/bin/blih

# CONFIG EMACS
git clone https://github.com/Epitech/epitech-emacs.git
cd epitech-emacs
git checkout 1f1ef05d25058e20050612e71578312bee513a5b
./INSTALL.sh system
cd .. && rm -rf epitech-emacs

install -m 644 ./bash_completion.d/blih /usr/share/bash-completion/completions
