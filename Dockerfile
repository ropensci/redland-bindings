FROM debian:testing

RUN apt-get update && apt-get install -y \
    autoconf \
    libtool \
    python-dev \
    librdf0-dev \
    swig \
    git

RUN git clone https://github.com/dajobe/redland-bindings.git
RUN cd redland-bindings && \
    ./autogen.sh && \
    autoconf configure.ac > configure && \
    ./configure
RUN cd python && make
    
