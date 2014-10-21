#!/bin/bash
declare srcdir = "."
declare SWIG_OPTS = "-I$(srcdir) -I$(srcdir)/.. -debug-typemap"
#swig -v -r $(SWIG_OPTS) -o Redland_wrap.c /usr/share/redland/Redland.i
swig -v -r -o Redland_wrap.c Redland.i 
R CMD SHLIB Redland_wrap.c
