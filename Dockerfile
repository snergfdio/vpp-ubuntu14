FROM ubuntu:14.04
MAINTAINER Ed Kern <ejk@cisco.com>
LABEL Description="VPP ubuntu 14 baseline" Vendor="cisco.com" Version="1.0"


# Setup the environment
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -q update && \
    apt-get -y -qq upgrade && \
    apt-get install -y -qq \
        bash \
        bash-completion \
        bc \
        biosdevname \
        ca-certificates \
        cloud-init \
        cron \
        curl \
        dbus \
        dstat \
        ethstatus \
        file \
        fio \
        htop \
        ifenslave \
        ioping \
        iotop \
        iperf \
        iptables \
        iputils-ping \
        less \
        locate \
        lsb-release \
        lsof \
        make \
        man-db \
        mdadm \
        mg \
        mosh \
        mtr \
        multipath-tools \
        nano \
        net-tools \
        netcat \
        nmap \
        ntp \
        ntpdate \
        open-iscsi \
        python-apt \
        python-pip \
        python-yaml \
        rsync \
        rsyslog \
        screen \
        shunit2 \
        socat \
        software-properties-common \
        ssh \
        sudo \
        sysstat \
        tar \
        tcpdump \
        tmux \
        traceroute \
        unattended-upgrades \
        uuid-runtime \
        vim \
        wget \
        apt-transport-https \
        default-jre-headless \
        chrpath \
        nasm

RUN add-apt-repository -y ppa:openjdk-r/ppa

RUN apt-get -q update && \
    apt-get install -y -qq \
        unzip \
        xz-utils \
        puppet \
        git \
        git-review \
        libxml-xpath-perl \
        make \
        wget \
        openjdk-7-jdk \
        openjdk-8-jdk \
        jq \
        libffi-dev \
        python-all

RUN update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java  && \
    update-alternatives --set javac /usr/lib/jvm/java-7-openjdk-amd64/bin/javac

RUN apt-get -q update && \
    apt-get install -y -qq \
        autoconf \
        automake \
        autotools-dev \
        bison \
        ccache \
        cscope \
        debhelper \
        dh-apparmor \
        dh-systemd \
        dkms \
        ed \
        exuberant-ctags \
        gettext \
        gettext-base \
        intltool-debian \
        lcov \
        libapr1 \
        libapr1-dev \
        libasprintf-dev \
        libasprintf0c2 \
        libbison-dev \
        libconfuse-common \
        libconfuse-dev \
        libconfuse0 \
        libcroco3 \
        libexpat1-dev \
        libganglia1 \
        libganglia1-dev \
        libgd-gd2-perl \
        libgettextpo-dev \
        libgettextpo0 \
        libltdl-dev \
        libmail-sendmail-perl \
        libpython-dev \
        libpython2.7-dev \
        libsctp-dev \
        libsigsegv2 \
        libssl-dev \
        libssl-doc \
        libsys-hostname-long-perl \
        libtool \
        libunistring0 \
        m4 \
        pkg-config \
        po-debconf \
        python-dev \
        python-virtualenv \
        python2.7-dev \
        uuid-dev \
        zlib1g-dev

RUN gem install package_cloud


# Configure locales
#RUN locale-gen en_US.UTF-8 && \
#    dpkg-reconfigure locales

# Fix permissions
RUN chown root:syslog /var/log \
    && chmod 755 /etc/default

RUN mkdir /workspace
RUN mkdir -p /var/ccache
ENV CCACHE_DIR=/var/ccache



RUN ln -s /var/ccache /tmp/ccache
