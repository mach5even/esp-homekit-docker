FROM bitnami/minideb:jessie

LABEL description="esp-homekit build environment"

RUN apt-get update -y

RUN apt-get install make unrar-free autoconf automake libtool gcc g++ gperf \
    flex bison texinfo gawk ncurses-dev libexpat-dev python-dev python python-serial \
    sed git unzip bash help2man wget bzip2 libtool-bin -y

RUN git clone --recursive https://github.com/pfalcon/esp-open-sdk.git

ENV CT_ALLOW_BUILD_AS_ROOT_SURE True
RUN cd esp-open-sdk && make toolchain esptool libhal STANDALONE=n

RUN git clone --recursive https://github.com/Superhouse/esp-open-rtos.git
RUN apt-get install python-pip -y
RUN pip install serial

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]