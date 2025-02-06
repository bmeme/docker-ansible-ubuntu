FROM ubuntu:22.04
LABEL   com.bmeme.project.family='Ubuntu Docker Image' \
        com.bmeme.project.version='22.04-2.17' \
        com.bmeme.maintainer.1='Daniele Piaggesi <daniele.piaggesi@bmeme.com>' \
        com.bmeme.maintainer.2='Roberto Mariani <roberto.mariani@bmeme.com>' \
        com.bmeme.refreshedat='2025-02-06'

ARG DEBIAN_FRONTEND=noninteractive
ENV UBUNTU_VERSION 22.04
ENV ANSIBLE_CORE_VERSION 2.17

# Install dependencies.
RUN apt-get update; \
    apt-get install -y --no-install-recommends \
        apt-utils \
        build-essential \
        software-properties-common \
        locales \
        python3-dev \
        python3-setuptools \
        python3-pip \
        python3-yaml \
        rsyslog \ 
        systemd \ 
        systemd-cron \
        sudo; \
    apt-get clean; \
    rm -Rf /var/lib/apt/lists/*; \
    rm -Rf /usr/share/doc; \
    rm -Rf /usr/share/man; \
    # Configure Rsyslog
    sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf; \
    # Set locale
    locale-gen en_US.UTF-8; \
    # Remove unnecessary getty and udev targets that result in high CPU usage when using
    # multiple containers with Molecule (https://github.com/ansible/molecule/issues/1104)
    rm -f /lib/systemd/system/systemd*udev*; \
    rm -f /lib/systemd/system/getty.target
    

# Upgrade Pip, install and configure Ansible.
RUN python3 -m pip install --upgrade pip; \
    python3 -m pip install ansible-core==${ANSIBLE_CORE_VERSION}; \
    mkdir -p /etc/ansible; \
    echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# Copy fake initctl
COPY $UBUNTU_VERSION/initctl .
RUN chmod +x initctl && rm -fr /sbin/initctl && ln -s /initctl /sbin/initctl

VOLUME ["/sys/fs/cgroup", "/tmp", "/run"]
CMD ["/lib/systemd/systemd"]