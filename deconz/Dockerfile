ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install deCONZ dependencies
ARG BUILD_ARCH
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        udev \
        iproute2 \
        iputils-ping \
        kmod \
        libcap2-bin \
        libqt5core5a \
        libqt5gui5 \
        libqt5network5 \
        libqt5serialport5 \
        libqt5sql5 \
        libqt5websockets5 \
        libqt5widgets5 \
        lsof \
        netcat \
        sqlite3 \
        tigervnc-common \
        tigervnc-standalone-server \
        wget \
        wmii \
        xfonts-base \
        xfonts-scalable \
    && rm -rf /var/lib/apt/lists/* \
    \
    && curl -L https://github.com/gentoo/eudev/archive/master.tar.gz | tar -xz \
    && cp eudev-master/rules/* /etc/udev/rules.d/ \
    && rm -rf eudev-master

# Install deCONZ
ARG DECONZ_VERSION
RUN curl -q -L -o /deconz.deb https://www.dresden-elektronik.de/deconz/raspbian/alpha/deconz_${DECONZ_VERSION}-debian-stretch-beta_arm64.deb \
    && dpkg -i /deconz.deb \
    && rm -f /deconz.deb \
    && chown root:root /usr/bin/deCONZ* \
    && sed -i 's/\/root/\/data/' /etc/passwd

COPY data/run.sh data/discovery.sh /
COPY data/ika-otau-dl.sh /bin/

CMD ["/run.sh"]
