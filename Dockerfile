FROM ubuntu:22.04

# refresh/upgrade packages
RUN apt update
RUN apt upgrade

# git
RUN apt install -y git

# change into home directory
WORKDIR "/root"

# add apt repositories fix (could not add emacs ppa)
RUN apt install -y software-properties-common

# emacs
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
