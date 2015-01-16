package App::OverWatch::Event;
# ABSTRACT: Event object

use strict;
use warnings;
use utf8;

use Moo;
use namespace::clean;

has system    => ( is => 'ro' );
has subsystem => ( is => 'ro' );
has worker    => ( is => 'ro' );
has eventtype => ( is => 'ro' );
has ctime     => ( is => 'ro' );
has data      => ( is => 'ro' );

1;

=head1 ATTRIBUTES

=head2 system

=head2 subsystem

=head2 worker

=head2 eventtype

=head2 ctime

=head2 data

=cut

