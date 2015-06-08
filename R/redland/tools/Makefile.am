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

R=R

SRCDIR=../src
SRCS=$(SRCDIR)/redland.c $(SRCDIR)/util.c

MAKEVARS=$(SRCDIR)/Makevars

LIBS=$(SRCDIR)/redland.so
CLEAN_FILES = aclocal.m4 \
        autoscan.log  \
        config.h \
        ../src/redland.o \
        stamp-h1 \
        ../src/util.o \
        autom4te.cache \
        config.h.in \
        config.log \
	Makefile \
	ltmain.sh \
        config.status

$(LIBS): $(SRCS)
	-echo "PKG_CFLAGS = @LIBRDF_CPPFLAGS@" > $(MAKEVARS)
	-echo "PKG_LIBS = @LIBRDF_LDFLAGS@ @RASQAL_LDFLAGS@ " >> $(MAKEVARS)
	cd $(SRCDIR) && R CMD SHLIB redland.c util.c

#$(MAKEVARS):
#	-echo "PKG_CFLAGS = @LIBRDF_CPPFLAGS@" > $@
#	-echo "PKG_LIBS = @LIBRDF_LDFLAGS@ @RASQAL_LDFLAGS@ " >> $@

all:	${LIBS}

dev-clean:
	rm -f $(MAKEVARS) ; \
	rm -f $(LIBS) ; \
	for fname in $(CLEAN_FILES); do \
		if [ -d "$$fname" ]; then \
			rm -f $$fname/* ; \
                	rmdir $$fname ; \
		else \
			if [ -e "$$fname" ]; then rm -f $$fname ; fi \
		fi \
	done;

