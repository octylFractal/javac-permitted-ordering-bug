javac-permitted-ordering-bug
============================
Reproducer for JDK-8322477. All Rights Reserved, Gradle Inc.

Usage
=====
Run `./reproducer.sh <javac>`. The printed `sha1sum`s should match for both `alone` and `others` if the bug is fixed, otherwise they will differ.
