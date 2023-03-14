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

# add apt repositories fix (could not add emacs ppa)
RUN apt install -y software-properties-common

# emacs
RUN add-apt-repository ppa:kelleyk/emacs
RUN apt update
RUN apt install -y emacs28-nativecomp
# ripgrep
RUN apt install -y ripgrep

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

# dependencies for 573 hw2
RUN apt install -y build-essential
run apt install -y cmake
