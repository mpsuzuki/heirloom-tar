AC_PREREQ([2.62])
AC_INIT([heirloom-tar], [0.0.20251114], [https://github.com/mpsuzuki/heirloom-tar/-/issues])
AM_INIT_AUTOMAKE([foreign])

# Set default prefix
AC_PREFIX_DEFAULT(["/usr/ccs"])

# Checks for programs.
AC_PROG_CC
AC_PROG_MAKE_SET
AC_PROG_RANLIB

AC_PATH_PROGS([shell],[sh],,[/sbin:/bin:/usr/bin])
AC_DEFINE_UNQUOTED([SHELL],["$ac_cv_path_shell"],[shell for tar to invoke "sort" command])

# Checks
AC_ARG_WITH([DEFBIN],
            [AS_HELP_STRING([--with-defbin=<dirname_DEFBIN>],
                            [set directory to search "sort" before $PATH, default is /usr/5bin])],
            [DEFBIN="$withval"],[DEFBIN="/usr/5bin"])
if test -n "$DEFBIN"
then
  AC_DEFINE_UNQUOTED([DEFBIN],["$DEFBIN"],
                     [directory for "tar" to search "sort" command])
fi

AC_ARG_WITH([SV3BIN],
            [AS_HELP_STRING([--with-sv3bin=<dirname_SV3BIN>],
                            [directory for "tar" to search "sort" before DEFBIN, default is none])],
            [SV3BIN="$withval"],[SV3BIN=""])
if test -n "$SV3BIN"
then
  AC_DEFINE_UNQUOTED([SV3BIN],["$SV3BIN"],
                     [directory for tar to search "sort" command before DEFBIN])
fi

AC_ARG_WITH([TARDFL],
            [AS_HELP_STRING([--with-tardfl=<pathname_tar.dfl>],
                            [pathname of "tar.dfl" to load default values, default is /etc/default/tar.dfl])],
            [TARDFL="$withval"],[TARDFL="/etc/default/tar.dfl"])
if test -n "$TARDFL"
then
  AC_DEFINE_UNQUOTED([TARDFL],["$TARDFL"],
                     [pathname of setting file for "tar" default values])
fi

HEIRLOOM_FIND_LIBCOMMON

AS_IF([ test "x${build_included_libcommon}" = xyes ],
      [ AC_CONFIG_SUBDIRS([heirloom-libcommon]) ])


AC_HEADER_MAJOR

AC_CHECK_HEADER([malloc.h],[
  AC_DEFINE([HAVE_MALLOC_H],[1],[Define to 1 if you have <malloc.h> header file.])
],[
  AC_CHECK_DECL([malloc],[
    AC_DEFINE([HAVE_STDLIB_H_MALLOC],[1],[Define to 1 if stdlib.h declares malloc().])
  ],[
    AC_MSG_ERROR([could not find a header file to declare malloc()])
  ],[#include <stdlib.h>])
])

AC_CHECK_HEADER([alloca.h],[
  AC_DEFINE([HAVE_ALLOCA_H],[1],[Define to 1 if you have <alloca.h> header file.])
],[
  AC_CHECK_DECL([alloca],[
    AC_DEFINE([HAVE_STDLIB_H_ALLOCA],[1],[Define to 1 if stdlib.h declares alloca().])
  ],[
    AC_MSG_ERROR([could not find a header file to declare alloca()])
  ],[#include <stdlib.h>])
])

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([GNUmakefile])
AC_OUTPUT
