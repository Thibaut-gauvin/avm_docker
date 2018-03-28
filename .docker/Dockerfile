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
        curl \
        vim


# Add local user & give sudo privilege
RUN useradd --shell /bin/bash -u ${DOCKER_USER_ID} -o -c "" -m ${DOCKER_USER} \
    && adduser ${DOCKER_USER} sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && export HOME=/home/${DOCKER_USER} \
    && export USER=${DOCKER_USER}


# Override default user bash config
ADD .bashrc /home/${DOCKER_USER}/.bashrc
RUN chown ${DOCKER_USER}:${DOCKER_USER} /home/${DOCKER_USER}/.bashrc


# Clone avm git repository
RUN git clone https://github.com/ahelal/avm.git /opt/avm \
    && chown -R ${DOCKER_USER}:${DOCKER_USER} /opt/avm


# Install Ansible 2.1.6.0 using pip and label it 'v2.1'
ENV ANSIBLE_VERSIONS_0="2.1.6.0"
ENV ANSIBLE_LABEL_0="v2.1"
ENV INSTALL_TYPE_0="pip"

# Install Ansible 2.2.3.0 using pip and label it 'v2.2'
ENV ANSIBLE_VERSIONS_1="2.2.3.0"
ENV ANSIBLE_LABEL_1="v2.2"
ENV INSTALL_TYPE_1="pip"

# Install Ansible 2.3.1.0 using pip and label it 'v2.3'
ENV ANSIBLE_VERSIONS_2="2.3.3.0"
ENV ANSIBLE_LABEL_2="v2.3"
ENV INSTALL_TYPE_2="pip"

# Install Ansible 2.4.4.0 using pip and label it 'v2.4'
ENV ANSIBLE_VERSIONS_3="2.4.3.0"
ENV ANSIBLE_LABEL_3="v2.4"
ENV INSTALL_TYPE_3="pip"

# Set default version
ENV ANSIBLE_DEFAULT_VERSION="v2.1"

# For debug avm install
ENV AVM_VERBOSE="v"

# Run install script
RUN su ${DOCKER_USER} -c "cd /opt/avm && TERM=xterm ./setup.sh"
