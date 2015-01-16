package App::OverWatch::DB::mysql;
# ABSTRACT: MySQL subclass for OverWatch DB

use strict;
use warnings;
use utf8;

use App::OverWatch::DB;
use App::OverWatch::Config;

use DBIx::Connector;

use base 'App::OverWatch::DB';

sub required_dbopts {
    return qw( dsn user password );
}

sub connect {
    my $self = shift;

    my $Config = $self->{Config};
    my $dsn      = $Config->dsn();
    my $user     = $Config->user();
    my $password = $Config->password();

    my $conn = DBIx::Connector->new($dsn, $user, $password, {
        RaiseError => 1,
        PrintError => 0,
        AutoCommit => 1,
        mysql_enable_utf8 => 0,
    });

    return $conn;
}

1;

=head1 NAME

App::OverWatch::DB::mysql - MySQL Backend for App::OverWatch::DB

=head1 METHODS

=head2 required_dbopts

List of required attributes for our DBIx::Connector.

=head2 connect

Connect to the database.

=cut
