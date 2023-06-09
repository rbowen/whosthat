use 5.036001;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME => 'WhosThat',
    VERSION_FROM => 'lib/WhosThat.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    PREREQ_PM     => { 'Test::More' => 0, 'YAML::Tiny' => 0, },
    ABSTRACT_FROM => 'lib/WhosThat.pm',    # retrieve abstract from module
    AUTHOR        => 'rbowen <rbowen@rcbowen.com>',
    LICENSE       => 'apache',
    EXE_FILES     => [
        qw(bin/whosthat bin/whoworkson
          bin/addwho bin/editwho )
    ],
);

