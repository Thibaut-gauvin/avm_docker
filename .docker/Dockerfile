# http://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#running-from-source
FROM debian:jessie

ARG DOCKER_USER="devops"
ARG DOCKER_USER_ID=1001
ENV DEBIAN_FRONTEND="noninteractive"


# Install stuff
RUN apt-get update -qq \
    && apt-get install -y \
        build-essential \
        ca-certificates \
        python \
        python-pip \
        python-dev \
        libffi-dev \
        libssl-dev \
        libxml2-dev \
        libxslt1-dev \
        zlib1g-dev \
        git \
        sudo \
        wget \
        curl


# Add local user & give sudo privilege
RUN useradd --shell /bin/bash -u ${DOCKER_USER_ID} -o -c "" -m ${DOCKER_USER} \
    && adduser ${DOCKER_USER} sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && export HOME=/home/${DOCKER_USER}


# Override default user bash config
ADD .bashrc /home/${DOCKER_USER}/.bashrc
RUN chown ${DOCKER_USER}:${DOCKER_USER} /home/${DOCKER_USER}/.bashrc


# Clone avm git repository
RUN git clone https://github.com/ahelal/avm.git /opt/avm \
    && chown -R ${DOCKER_USER}:${DOCKER_USER} /opt/avm


ENV ANSIBLE_VERSIONS_0="2.2.3.0"
ENV ANSIBLE_LABEL_0="v2.2"
ENV INSTALL_TYPE="pip"
ENV ANSIBLE_DEFAULT_VERSION="v2.2"


# Run install script
RUN su ${DOCKER_USER} -c "cd /opt/avm && DEBIAN_FRONTEND=noninteractive ./setup.sh"
