# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl WhosThat.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 4;
BEGIN { use_ok('WhosThat') };

use_ok('WhosThat::Who');
use_ok('WhosThat::Project');
use_ok('WhosThat::Service');

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

