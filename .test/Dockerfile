FROM debian:bookworm

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sudo make git tree dialog apt-utils

RUN useradd -m -s /bin/bash user && \
    echo 'user:password' | chpasswd && \
    usermod -aG sudo user

WORKDIR /home/user/mini-dots

USER user

ENTRYPOINT ["bash"]
