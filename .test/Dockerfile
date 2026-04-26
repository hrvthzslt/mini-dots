FROM debian:bookworm

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sudo curl make git tree cloc dialog apt-utils ncurses-term bash-completion cbonsai locales \
            python3.11 python3.11-venv

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN useradd -m -s /bin/bash user && \
    echo 'user:pass' | chpasswd && \
    usermod -aG sudo user

USER user

RUN echo "set -o vi" >> /home/user/.bashrc && \
    echo "export TERM=xterm-256color" >> /home/user/.bashrc

WORKDIR /home/user

RUN git clone https://github.com/hrvthzslt/sysperc && \
    git clone https://github.com/hrvthzslt/markdown-server-flask

WORKDIR /home/user/mini-dots

ENTRYPOINT ["bash"]
