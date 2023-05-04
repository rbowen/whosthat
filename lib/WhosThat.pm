package WhosThat;

use 5.036001;
use strict;
use warnings;
use YAML::Tiny;

require Exporter;

our @ISA = qw(Exporter);

our $VERSION = '0.01';
our $DATA    = '/home/rbowen/Dropbox/whosthat';
our $DOMAIN  = 'amazon.com'; # Default email domain for new records

# Doesn't export any functions, for now
our %EXPORT_TAGS = (
    'all' => [
        qw(

        )
    ]
);

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

# Global variables. Sue me.
our @EXPORT = qw(
    $DATA $DOMAIN
);

# Returns a list of who hashes
sub listwho {
    my $whodir = $DATA . '/who';
    my @who;
    opendir( DIR, $whodir ) or die "Could not open $whodir\n";

    while ( my $whofile = readdir(DIR) ) {
        next if $whofile =~ m/^\./;
        next if $whofile =~ m/template/;

        # slurp
        my $f = $DATA . '/who/' . $whofile;
        my $w = YAML::Tiny->read( $f );

        # Required fields
        $w->[0]->{name} ||= 'UNNAMED';
        $w->[0]->{email} ||= 'NOEMAIL';
        $w->[0]->{title} ||= 'UNKNOWN';

        # Convenience
        $w->[0]->{filename} = $f;

        # @amazon.com specific handling
        if ( $w->[0]->{email} =~ /amazon\.com/ ) {
            my ($alias) = ( $w->[0]->{email} =~ m/^(.*?)@/ );
            $w->[0]->{alias} = $alias;
            $w->[0]->{phonetool} = 'https://phonetool.amazon.com/users/' . $w->[0]->{alias};
        }

        push @who, $w->[0];
    }
    closedir(DIR);

    return @who;
}

# Load one person
sub loadwho {
    shift;
    my ($w) = @_;
    my $f = $DATA . '/who/' . lc($w) . '.yml';
    if ( -e $f ) {
        my $who = YAML::Tiny->read($f);
        $who->[0]->{filename} = $f;
        return $who->[0];
    } else {
        return 0;
    }
}

# Returns a project hashref, or 0 if that project isn't found
sub loadproject {
    shift;
    my ($name) = @_;
    my $f = $DATA . '/project/' . lc($name) . '.yml';

    if ( -e $f ) {
        my $proj = YAML::Tiny->read( $f );
        return $proj->[0];
    } else {
        # warn("No project named $name\n");
        return 0;
    }
}

# A team is a group, or department, or other group that an individual
# works with. Someone can be on multiple teams.
sub loadteam {
    shift;
    my ($name) = @_;
    my $f = $DATA . '/team/' . lc($name) . '.yml';

    if ( -e $f ) {
        my $team = YAML::Tiny->read( $f );
        return $team->[0];
    } else {
        # warn("No team named $name\n");
        return 0;
    }
}

1;
__END__

=head1 NAME

WhosThat - utility functions for the WhosThat simplest-possible CRM.

=head1 SYNOPSIS

 use WhatsThat;

=head1 DESCRIPTION

Provides simple functions for loading people, projects, and
teams, for the 'whosthat' and 'whoworkson' commandline
utilities.

=head1 AUTHOR

rbowen <rbowen@rcbowen.com>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2023 by Rich Bowen

This entire package is free software under the Apache License 2.0. See
LICENSE.

=cut


