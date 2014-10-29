FROM debian:testing

RUN apt-get update && apt-get install -y \
    autoconf \
    libtool \
    python-dev \
    librdf0-dev \
    librdf0 \
    libraptor2-dev \
    librasqal3-dev \
    librasqal3 \
    swig3.0 \
    git \
    make \
    vim \
    r-recommended
RUN cd /usr/bin && ln -s swig3.0 swig && cd /
RUN git clone https://github.com/ropensci/redland-bindings.git
RUN cd redland-bindings && \
    ./autogen.sh && \
    autoconf configure.ac > configure && \
    ./configure
##RUN cd /redland-bindings/R && swig.sh

## Build & run the container interactively and make should work:
##     docker build -t redland-bindings .
##     docker run --rm -it redland-bindings /bin/bash
##     cd redland-bindings/python && make
##     cd redland-bindings/R && swig.sh
