FROM ubuntu:latest

# Set the TZ
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update

# Set the locale
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Create non-root user
RUN useradd -m user &&          \
        adduser user sudo &&    \
        echo "user:user" | chpasswd

RUN apt-get install -y          \
        curl                    \
        gcc                     \
        g++                     \
        git                     \
        pkg-config              \
        make                    \
        libusb-1.0-0-dev        \
        build-essential         \
        wget                    \
        libssl-dev              \
        ca-certificates         \
        ssh                     \
        libboost-regex-dev      \
        libgtk2.0-dev           \
        pkg-config              \
        libavcodec-dev          \
        libavformat-dev         \
        libswscale-dev          \
        libgstreamer1.0-0       \
        gstreamer1.0-plugins-base \
        libjpeg-dev             \
        libpng-dev              \
        libtiff-dev             \
        libdc1394-22-dev        \
        apt-transport-https     \
        unzip                   \
        automake                \
        libtool                 \
        autoconf                \
        cpio                    \
        ocl-icd-libopencl1      \
        apt-utils

# Install python
RUN apt-get install -y  \
        python          \
        python-pip      \
        python-dev      \
        python-numpy    \
        python-opencv   \
        python3         \
        python3-pip     \
        python3-dev     \
        python3-numpy    \
        python3-opencv

# Install ctags
RUN apt-get install -y ctags

# CMake install
RUN wget http://www.cmake.org/files/v3.7/cmake-3.7.1.tar.gz --no-check-certificate && \
        tar xf cmake-3.7.1.tar.gz && \
        cd cmake-3.7.1 && \
        ./configure &&  \
        make -j8 &&     \
        make install
RUN rm -rf cmake-3.7.1.tar.gz cmake-3.7.1

# Install Git LFS
RUN wget https://github.com/git-lfs/git-lfs/releases/download/v2.3.4/git-lfs-linux-amd64-2.3.4.tar.gz && \
        tar xf git-lfs-linux-amd64-2.3.4.tar.gz && \
        cd git-lfs-2.3.4 && \
        PREFIX=/usr/ ./install.sh && \
        cd .. &&    \
        rm git-lfs-linux-amd64-2.3.4.tar.gz && \
        rm -rf git-lfs-2.3.4

RUN wget https://github.com/intel/compute-runtime/releases/download/18.28.11080/intel-opencl_18.28.11080_amd64.deb && \
        dpkg -i intel-opencl_18.28.11080_amd64.deb && \
        rm intel-opencl_18.28.11080_amd64.deb

# Install tmux
RUN apt-get install -y libevent-dev libncurses5-dev libncursesw5-dev
RUN git clone https://github.com/tmux/tmux.git &&   \
        cd tmux &&      \
        ./autogen.sh && \
        ./configure &&  \
        make -j8 &&     \
        make install
RUN rm -rf tmux

# Install zsh
RUN apt-get install -y zsh

# Install vim
RUN apt remove -y vim vim-runtime gvim
RUN git clone https://github.com/vim/vim.git && \
        cd vim &&       \
        ./configure --with-features=huge \
        --enable-multibyte \
        --enable-pythoninterp=yes \
        --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
        --enable-python3interp=yes \
        --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/ \
        --enable-cscope \
        --prefix=/usr/local/ && \
        make -j8 &&     \
        make install
RUN rm -rf vim

# Install radare2
RUN git clone https://github.com/radare/radare2 && \
        cd radare2 &&   \
        ./sys/install.sh && \
        make install
RUN rm -rf radare2

# Initilise base user
USER user
WORKDIR /home/user
ENV HOME /home/user

RUN rm -rf /home/user/.vimrc /home/user/.vim /home/user/.bashrc /home/user/.bashrc.global   \
        /home/user/.gdbinit /home/user/.radare2rc /home/user/.tmux /home/user/.tmux.conf    \
        /home/user/.zsh /home/user/.zshrc

RUN cd /home/user &&    \
        git clone https://github.com/ilyachur/dotfiles.git && \
        ln -s /home/user/dotfiles/.vimrc /home/user/.vimrc && \
        ln -s /home/user/dotfiles/.vim /home/user/.vim && \
        ln -s /home/user/dotfiles/.gdbinit /home/user/.gdbinit && \
        ln -s /home/user/dotfiles/.radare2rc /home/user/.radare2rc && \
        ln -s /home/user/dotfiles/.tmux /home/user/.tmux && \
        ln -s /home/user/dotfiles/.tmux.conf /home/user/.tmux.conf && \
        ln -s /home/user/dotfiles/.bashrc /home/user/.bashrc && \
        ln -s /home/user/dotfiles/.bashrc.global /home/user/.bashrc.global

RUN yes "" | vim +'PlugInstall --sync' +qa
