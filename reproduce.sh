#!/usr/bin/env bash

set -e

if [ "$#" != 1 ]; then
    printf '%s\n' "usage: ./reproduce.sh <path-to-javac>" >&2
    exit
fi

javac="$1"

(
cd alone
printf '%s\n' "Compiling 'alone/Foo.java'..."
"$javac" Foo.java
)
(
cd others
printf '%s\n' "Compiling 'others/{FooUser,Foo}.java'..."
# FooUser must be listed first for the bug to appear!
"$javac" FooUser.java Foo.java
)

printf '%s\n' 'sha1sums, files with the same name should match:'
sha1sum alone/Foo.java others/Foo.java alone/Foo.class others/Foo.class
