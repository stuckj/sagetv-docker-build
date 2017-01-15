FROM openjdk:8-jdk
MAINTAINER John Stucklen <stuckj@gmail.com>

# TODO: Possible to do setup in here that wipes the last overlay (from running)
# or can that only be done with a runtime flag? Investigate...don't need
# anything beyond the deb package (or whatever final package you make).

ENV JDK_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN echo "deb http://deb.debian.org/debian jessie non-free" > sources.list.d/jessie-non-free.list

# TODO: Need jhead too apparently...

# TODO: Follow best practices for apt-get
RUN apt-get update \
    && apt-get install -y make gcc g++ libraw1394-dev libavc1394-dev \
                          libiec61883-dev libz-dev libfreetype6-dev automake \
                          libfaac-dev libtool
RUN git clone https://github.com/google/sagetv.git
WORKDIR /sagetv/build
ENTRYPOINT ["./buildall.sh"]
