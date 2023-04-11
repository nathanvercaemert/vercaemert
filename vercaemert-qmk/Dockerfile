FROM ubuntu:22.04

# refresh/upgrade packages
RUN apt update
RUN apt upgrade

# bash
RUN bash

# git
RUN apt install -y git

# curl
RUN apt install -y curl

# ripgrep
RUN apt install -y ripgrep

# change into home directory
WORKDIR "/root"

# #######
# #######
# mutagen
# #######
# #######
# homebrew
# dependency for homebrew
RUN apt update
RUN apt install -y build-essential
# homebrew installation (redirect at end of command to skip prompt)
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null
# mutagen installation
RUN /home/linuxbrew/.linuxbrew/bin/brew install mutagen-io/mutagen/mutagen
# remove dependencies
RUN apt remove -y build-essential

# *****
# *****
# emacs
# *****
# *****
# add apt repositories fix (can not add emacs ppa without it)
RUN apt install -y software-properties-common
# install
RUN add-apt-repository ppa:kelleyk/emacs
RUN apt update
RUN apt install -y emacs28-nativecomp

# toggle to re-clone emacs configuration
# RUN ls &&\
#     git clone https://github.com/nathanvercaemert/emacs.git
# toggle
RUN git clone https://github.com/nathanvercaemert/emacs.git

# install emacs packages
RUN ln -s ./emacs/.emacs.d
RUN ln -s ./emacs/.emacs
# run .emacs as script so that it completes and closes
# (also because otherwise my config isn't loaded)
RUN emacs --script .emacs

# ***
# ***
# qmk
# ***
# ***
RUN apt install -y python3-pip
RUN python3 -m pip install qmk
RUN qmk setup
RUN qmk config user.keyboard=ergodox_ez
RUN qmk config user.keymap=nathanvercaemert
RUN apt install -y gcc-avr avr-libc cmake build-essential
