# -*- Mode: Makefile -*-
#
# Makefile.am - automake file for R interface to Redland
#
# Copyright (C) 2014 Matthew Jones
# Derived from code that was originally copyrighted:
# Copyright (C) 2010 David Beckett - http://www.dajobe.org/
# And used under the terms of the Apache V2.0 license.
# 
# This package is Free Software and part of Redland http://librdf.org/
# 
# It is licensed under the following three licenses as alternatives:
#   1. GNU Lesser General Public License (LGPL) V2.1 or any newer version
#   2. GNU General Public License (GPL) V2 or any newer version
#   3. Apache License, V2.0 or any newer version
# 
# You may not use this file except in compliance with at least one of
# the above three licenses.
# 
# See LICENSE.html or LICENSE.txt at the top of this package for the
# full license terms.
#

AM_CPPFLAGS=@CPPFLAGS@ @LIBRDF_CPPFLAGS@ -DREDLAND_BINDINGS_VERSION=\"@VERSION@\"
AM_CFLAGS=@STANDARD_CFLAGS@ @LIBRDF_CPPFLAGS@

AM_LDFLAGS=@LIBRDF_LDFLAGS@

R=R

R_PACKAGE=redland
R_PACKAGE_SRC=$(R_PACKAGE)/src

R_CFLAGS=@R_CFLAGS@
R_LDFLAGS=@R_LDFLAGS@
R_SO_SUFFIX=so

SWIG_OUTPUTS=$(R_PACKAGE_SRC)/$(R_PACKAGE).c
SWIG_CRUFT=

TEST_CRUFT=redland/inst/tests/test-out.rdf

EXTRA_DIST= $(SWIG_OUTPUTS)

CLEANFILES=$(R_PACKAGE_SRC)/$(R_PACKAGE).o $(R_PACKAGE)-stamp \
$(R_PACKAGE_SRC)/$(R_PACKAGE).$(R_SO_SUFFIX) $(R_PACKAGE_SRC)/util.o \
$(R_PACKAGE).bundle $(TEST_CRUFT)
MAINTAINERCLEANFILES=$(SWIG_OUTPUTS) $(SWIG_CRUFT) $(R_PACKAGE).c.orig

RUN=@REDLAND_RUN@

SWIG_OPTS=-I$(srcdir)

$(R_PACKAGE).c: @REDLAND_SWIG@
	swig -r -namespace -v $(SWIG_OPTS) -module $(R_PACKAGE) -outdir $(R_PACKAGE)/R -o redland/src/$@ Redland.i
	cat Redland.R.in >> redland/R/redland.R
	mv $(R_PACKAGE)/R/NAMESPACE $(R_PACKAGE)/inst/build/NAMESPACE.swig
	cd $(R_PACKAGE) && $(R) --no-save -e 'library(devtools); library(roxygen2); document()'
	-cd ..

#swig -r -namespace -v $(SWIG_OPTS) -module $(R_PACKAGE) -outdir $(R_PACKAGE)/R -o redland/src/$@ @REDLAND_SWIG@

$(R_PACKAGE).o: $(R_PACKAGE).c
	-cd $(R_PACKAGE_SRC) && R CMD SHLIB $(R_PACKAGE).c util.c
	-cd ../..

$(R_PACKAGE).$(R_SO_SUFFIX): $(R_PACKAGE)-stamp
$(R_PACKAGE)-stamp: $(R_PACKAGE).o
	-touch $(R_PACKAGE)-stamp

test-R:
	pwd
	cd $(R_PACKAGE) && $(R) --no-save -e 'library(devtools); library(testthat); library(roxygen2); load_all(); test()'
	cd ..

check-local: test-R

all: $(R_PACKAGE).$(R_SO_SUFFIX)

