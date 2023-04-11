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

# 573
# x11
RUN apt install -y x11-apps
ENV DISPLAY 172.24.224.1:0
# firefox
RUN apt install -y libdbus-glib-1-2
RUN apt install -y libx11-xcb1
RUN apt install -y libegl1-mesa libgl1-mesa-glx libpci3
RUN curl -L -o firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
RUN tar xjf firefox.tar.bz2
RUN mv firefox /opt/
RUN ln -s /opt/firefox/firefox /usr/local/bin/firefox
RUN rm firefox.tar.bz2

