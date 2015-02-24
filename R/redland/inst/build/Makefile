#   This work was created by the National Center for Ecological Analysis and Synthesis.
#
#     Copyright 2014
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
# This Makefile is used in the redland-bindings development environment to 
# bootstrap the GNU autotools configuration used to make the src/configure
# script that allows compiling redland source code (in redland/src) needed 
# to run the R redland package. This Makefile is also used during installation
# of the R redland package on a user's machine to create the OS specific 
# Makefile that performs the OS specific compilation.
# author: Peter Slaughter

# Note: this Makefile has dependancies in the src directory that are
# explicitly stated here because the Makefile in the src directory is
# created by autotools, so it may not exist when this Makefile runs.

CONFDIR=config
SUBDIRS=$(CONFDIR)

$(CONFDIR)/Makefile: $(CONFDIR)/Makefile.in $(CONFDIR)/configure 
	-cd $(CONFDIR) ; ./configure

$(CONFDIR)/configure: $(CONFDIR)/configure.ac
	-cd $(CONFDIR) ; autoconf

$(CONFDIR)/Makefile.in: $(CONFDIR)/Makefile.am
	-cd $(CONFDIR) ; aclocal ; automake --foreign --add-missing --copy --force-missing

all:	$(CONFDIR)/Makefile
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir all; \
	done

