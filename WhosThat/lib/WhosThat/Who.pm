package WhosThat::Who;
use strict;
use warnings;
use WhosThat;

BEGIN {
    use Exporter();
    use vars qw( @ISA @EXPORT );
    use WhosThat;

    @ISA = qw (Exporter WhosThat);
    @EXPORT = qw ();

}

sub new {
    my ( $class, @args ) = @_;
    my $self = bless( {}, $class );

    $self->load( @args );
}

sub load {
     
}

1;

__END__

=head1 NAME

WhosThat::Who - A person object

=head1 SYNPOSIS

 use WhosThat::Who
 my $who = WhosThat::Who->new( $name );


