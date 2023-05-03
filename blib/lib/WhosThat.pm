package WhosThat;

use 5.036001;
use strict;
use warnings;
use YAML::Tiny;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use WhosThat ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = (
    'all' => [
        qw(

        )
    ]
);

our $VERSION = '0.01';
our $DATA    = '/home/rbowen/devel/whosthat/data';

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
    $DATA
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

        # Phonetools
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

sub loadservice {
    shift;
    my ($name) = @_;
    my $f = $DATA . '/service/' . lc($name) . '.yml';

    if ( -e $f ) {
        my $service = YAML::Tiny->read( $f );
        return $service->[0];
    } else {
        # warn("No service named $name\n");
        return 0;
    }
}


1;
