FROM debian:bookworm

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sudo make git

ARG USER_ID
ARG GROUP_ID

RUN groupadd -g ${GROUP_ID} user && \
    useradd -m -u ${USER_ID} -g ${GROUP_ID} -s /bin/bash user && \
    echo 'user:password' | chpasswd && \
    usermod -aG sudo user

WORKDIR /home/user/mini-dots

USER user

ENTRYPOINT ["bash"]
