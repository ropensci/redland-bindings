R bindings for Redland
======================

Bind the [Redland librdf library](http://librdf.org) into the R environment, and expose the librdf API for R.

## Status

Experimental.  At this point all that is working is that we use SWIG to generate the wrapper library, compile that, and install it in R as a shared library.  Nothing is portable, and its really fragile. YMMV.

## Build notes

To build the package:

1. Install docker and load the Dockerfile into a container and run it
    ```bash
    docker build -t redland-bindings .
    docker run --rm -it redland-bindings /bin/bash
    ```

2. Run `autoconf` and `make` to generate the shared libraries and compile the R package code, and startup R
    ```bash
    cd /redland-bindings
    ./autogen.sh --with-R
	make
    cd R/redland
    ```

3. Load devtools in R and load the package
    ```r
    > install.packages("devtools")
    > library(devtools)
    > load_all()
    ```

4. Run a redland command
    ```r
    > library(redland)
    > world <- librdf_new_world()
    > world
    An object of class "_p_librdf_world_s"
    Slot "ref":
    <pointer: 0x38bd290>
    ```

5. Run the existing test suite
    ```r
    > install.packages("testthat")
    > library(testthat)
    > test()
    ```
