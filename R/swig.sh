#!/bin/bash
export srcdir = "."
export SWIG_OPTS = "-I$(srcdir) -I$(srcdir)/.."
swig -v -r $(SWIG_OPTS) -o Redland_wrap.c /usr/share/redland/Redland.i
R CMD SHLIB Redland_wrap.c
