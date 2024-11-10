FROM liyaosong/ubuntu:noble

RUN apt update && apt install -y \
    git \
    nano \
    net-tools \
    wget \
    && rm -rf /var/lib/apt/lists/*

COPY RELEASE /
COPY setup /

RUN chmod +x setup RELEASE && /setup
RUN chmod +x gitea

# 创建用户并指定 home 目录
RUN useradd -m -d /home/gitea -s /bin/bash gitea && \
    chown -R gitea:gitea /home/gitea

USER gitea


CMD ["/gitea"]

EXPOSE 3000 22