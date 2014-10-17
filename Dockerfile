FROM debian:testing

RUN apt-get update && apt-get install -y \
    autoconf \
    libtool \
    python-dev \
    librdf0-dev \
    swig \
    git \
    make

RUN git clone https://github.com/ropensci/redland-bindings.git
RUN cd redland-bindings && \
    ./autogen.sh && \
    autoconf configure.ac > configure && \
    ./configure

## Build & run the container interactively and make should work:
##     docker build -t redland-bindings .
##     docker run --rm -it redland-bindings /bin/bash
##     cd redland-bindings/python && make
