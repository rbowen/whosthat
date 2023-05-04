#!/bin/sh

perl Makefile.PL
make
make test
make install
make clean

echo
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "If there's any messages above about failing tests,
ensure that \$DATA is set correctly in lib/WhosThat.pm, and 
that the data directories exist, and then run this again ."
echo

