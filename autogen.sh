#!/bin/sh

git submodule update --init
for d in heirloom-libcommon
do
  (cd "$d" && ./autogen.sh)
done

aclocal -Iheirloom-libcommon
autoheader
automake -a
autoconf
