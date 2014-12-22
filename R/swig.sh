#!/bin/bash
#declare SWIG_OPTS = "-I$(srcdir) -I$(srcdir)/.."
#swig -v -r $(SWIG_OPTS) -o Redland_wrap.c /usr/share/redland/Redland.i
#cp NAMESPACE.in redland/NAMESPACE
swig -v -Wall -r -outdir redland/R -o redland/src/redland.c Redland.i 
#cat redland/R/NAMESPACE >> redland/NAMESPACE
#rm redland/R/NAMESPACE
cd redland/src
R CMD SHLIB redland.c
