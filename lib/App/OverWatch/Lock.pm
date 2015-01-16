package App::OverWatch::Lock;
# ABSTRACT: Lock object

use strict;
use warnings;
use utf8;

use Moo;
use namespace::clean;

has system => ( is => 'ro' );
has expiry => ( is => 'ro' );
has mtime  => ( is => 'ro' );
has worker => ( is => 'ro' );
has text   => ( is => 'ro' );
has status => ( is => 'ro' );

sub is_locked {
    my $self = shift;
    return 1 if ($self->status() eq 'LOCKED');
    return 0;
}

sub print {
    my $self = shift;

    foreach my $attr (qw( System Worker Status Mtime Expiry Text )) {
        my $lc_attr = lc($attr);
        printf("%-10s %s\n", "$attr:", $self->$lc_attr() // '');
    }
};

1;

=head1 ATTRIBUTES

=head2 system

=head2 expiry

=head2 mtime

=head2 worker

=head2 text

=head2 status

=head1 METHODS

=head2 is_locked

Returns 1 if locked, 0 otherwise.

=head2 print

Print to stdout.

=cut

