package Dispatch::Notification;

use strict;
use warnings;
use utf8;

use Moo;
use namespace::clean;

has system    => ( is => 'ro' );
has subsystem => ( is => 'ro' );
has worker    => ( is => 'ro' );
has ctime     => ( is => 'ro' );
has mtime     => ( is => 'ro' );
has fired     => ( is => 'ro' );
has text      => ( is => 'ro' );

1;



=head1 ATTRIBUTES

=head2 system

=head2 subsystem

=head2 worker

=head2 ctime

=head2 mtime

=head2 fired

=head2 text

