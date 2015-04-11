#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([redland], [1.0.17.2])

AC_CONFIG_SRCDIR([../src/redland.c])
#AC_CONFIG_HEADERS([config.h])

AM_INIT_AUTOMAKE
# Disable maintainer mode so that make will not try to rebuild all automake files
AM_MAINTAINER_MODE()

MIN_REDLAND_VERSION=1.0.15
OUR_REDLAND_VERSION=`echo $PACKAGE_VERSION | sed -e 's,\.[0-9]$,,'`

# Checks for programs.
AC_PROG_CC

AC_CHECK_PROGS(R, R)
AC_CHECK_PROGS(PKG_CONFIG, pkg-config)
OUR_REDLAND_VERSION=`echo $PACKAGE_VERSION | sed -e 's,\.[0-9]$,,'`

AC_MSG_CHECKING(for redland)
if $PKG_CONFIG --exists redland; then
  REDLAND_CONFIG="$PKG_CONFIG redland"
  REDLAND_VERSION=`$PKG_CONFIG redland --modversion`
  REDLAND_VERSION_DEC=`echo $REDLAND_VERSION | $AWK -F. '{printf("%d\n", 10000*$1 + 100*$2 + $3)};'`

  AC_MSG_RESULT($REDLAND_VERSION)
else
  AC_MSG_RESULT(not found)
  AC_MSG_ERROR(Redland is not installed - see http://librdf.org/ to get a version $OUR_REDLAND_VERSION or newer)
fi

if $PKG_CONFIG --atleast-version=$MIN_REDLAND_VERSION redland; then
  :
else
  AC_MSG_ERROR(Redland version $REDLAND_VERSION found. $MIN_REDLAND_VERSION or newer is required - see http://librdf.org/)
fi

# Checks for libraries.
AC_CHECK_LIB([raptor2], [raptor_parse])
AC_CHECK_LIB([rasqal], [rasqal_new_world])

# Checks for header files.
AC_CHECK_HEADERS([limits.h stdlib.h string.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([memset])

LIBRDF_CPPFLAGS="$LIBRDF_CPPFLAGS `$PKG_CONFIG redland --cflags`"
LIBRDF_LDFLAGS="$LIBRDF_LDFLAGS `$PKG_CONFIG redland --libs`"

RAPTOR_LDFLAGS=`$PKG_CONFIG raptor2 --libs`
RASQAL_LDFLAGS=`$PKG_CONFIG rasqal --libs`

AC_SUBST(LIBRDF_CPPFLAGS)
AC_SUBST(LIBRDF_LDFLAGS)

AC_SUBST(RAPTOR_LDFLAGS)
AC_SUBST(RASQAL_LDFLAGS)

AC_CONFIG_FILES(Makefile)
#AC_CONFIG_SUBDIRS()
AC_OUTPUT()
