package App::OverWatch::Config;
# ABSTRACT: Config object

use strict;
use warnings;
use utf8;

use Moo;
use namespace::clean;

has db_type   => ( is => 'ro' );
has dsn       => ( is => 'ro' );
has user      => ( is => 'ro' );
has password  => ( is => 'ro' );

1;

=head1 ATTRIBUTES

=head2 db_type

The type of backend database: mysql, postgres, sqlite

=head2 dsn

DSN used by DBI to connect to the database.

=head2 user

Database user (if required)

=head2 password

Database password (if required)

=cut



