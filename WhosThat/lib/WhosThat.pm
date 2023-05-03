package WhosThat;

use 5.036001;
use strict;
use warnings;

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

# Preloaded methods go here.

1;
__END__

=head1 NAME

WhosThat - Perl extension for basic CRM functionality.

=head1 SYNOPSIS

  use WhosThat;
  blah blah blah

=head1 DESCRIPTION

Basic CRM functionality at the command line.

=head2 EXPORT

None by default.

=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

rbowen, E<lt>rbowen@rcbowen.com<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2023 by rbowen

This library is released under the terms of the Apache License.

=cut
