FROM ubuntu:20.04

ARG NVIM_VERSION=v0.9.5
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y && apt install git gettext cmake unzip curl -y

RUN git clone -b $NVIM_VERSION --depth=1 https://github.com/neovim/neovim.git

WORKDIR neovim

RUN make CMAKE_BUILD_TYPE=RelWithDebInfo

RUN mv build/bin/nvim /nvim
