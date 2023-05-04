#!/bin/sh


perl Makefile.PL
make
make install
make clean

echo
echo "Ensure that \$DATA is set correctly in lib/WhosThat.pm, and then
run this again if necessary."
echo
