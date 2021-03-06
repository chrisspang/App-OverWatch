package App::OverWatch::Notify::mysql;
# ABSTRACT: MySQL subclass for Notify

use strict;
use warnings;
use utf8;

use base 'App::OverWatch::Notify';

sub create_table {
    my $self = shift;

    my $sql =<<'CREATESQL';
CREATE TABLE `notifications` (
    `system`    VARCHAR(50) NOT NULL,
    `subsystem` VARCHAR(50) NOT NULL,

    `worker`    VARCHAR(50) NOT NULL,

    `ctime`     TIMESTAMP NOT NULL,
    `mtime`     TIMESTAMP NOT NULL,

    `fired`     TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,

    `text`   VARCHAR(100) NOT NULL DEFAULT '',

    PRIMARY KEY ( `system`, `subsystem`, `worker` )

) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATESQL

    my $ret = $self->{DB}->dbix_run( $sql );
    return $ret;
}

1;

=head1 NAME

App::OverWatch::Notify::mysql - MySQL backend for App::OverWatch::Notify

=head1 METHODS

=head2 create_table

Create the 'notifications' table.

=cut

