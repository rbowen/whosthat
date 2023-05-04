# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl WhosThat.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 6;

# 1:
BEGIN { use_ok('WhosThat') };

# 2: Need YAML::Tiny or nothing will work
use_ok('YAML::Tiny');

# 3-6: Do the data directories exist?
ok( -e $DATA, 'Data directory exists' );
ok( -e "$DATA/who", 'Person data directory exists' );
ok( -e "$DATA/project", 'Project data directory exists' );
ok( -e "$DATA/team", 'Team data directory exists' );

