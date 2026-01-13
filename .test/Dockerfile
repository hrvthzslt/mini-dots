FROM debian:bookworm

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sudo make git tree cloc dialog apt-utils ncurses-term bash-completion

RUN useradd -m -s /bin/bash user && \
    echo 'user:pass' | chpasswd && \
    usermod -aG sudo user

USER user

RUN echo "set -o vi" >> /home/user/.bashrc && \
    echo "export TERM=xterm-256color" >> /home/user/.bashrc

WORKDIR /home/user

RUN git clone https://github.com/hrvthzslt/sysperc && \
    git clone https://github.com/hrvthzslt/palindrome && \
    git clone https://github.com/hrvthzslt/transloth && \
    git clone https://github.com/hrvthzslt/fortune-server

WORKDIR /home/user/mini-dots

ENTRYPOINT ["bash"]
