FROM debian:bookworm

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sudo make

RUN useradd -m -s /bin/bash user && \
    echo 'user:password' | chpasswd && \
    usermod -aG sudo user

WORKDIR /home/user/test

USER user

ENTRYPOINT ["tail", "-f", "/dev/null"]
