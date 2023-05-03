use 5.036001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'WhosThat',
    VERSION_FROM      => 'lib/WhosThat.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    PREREQ_PM         => { 'Test::More' => 0,
                         }, # e.g., Module::Name => 1.1
    ABSTRACT_FROM     => 'lib/WhosThat.pm', # retrieve abstract from module
    AUTHOR            => 'rbowen <rbowen@rcbowen.com>',
    LICENSE           => 'apache',
);
