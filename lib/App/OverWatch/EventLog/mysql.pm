package App::OverWatch::EventLog::mysql;
# ABSTRACT: MySQL subclass for EventLog

use strict;
use warnings;
use utf8;

use base 'App::OverWatch::EventLog';

sub create_table {
    my $self = shift;

    my $sql =<<'CREATESQL';
CREATE TABLE `events` (
    `system`    VARCHAR(50) NOT NULL,
    `subsystem` VARCHAR(50) NOT NULL,

    `worker`    VARCHAR(50) DEFAULT NULL,

    `eventtype` ENUM('START', 'PROGRESS', 'END', 'POINT') NOT NULL,

    `ctime`     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    `data`      BLOB

) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATESQL

    my $ret = $self->{DB}->dbix_run( $sql );
    return $ret;
}

1;

=head1 NAME

App::OverWatch::EventLog::mysql - MySQL backend for App::OverWatch::EventLog

=head1 METHODS

=head2 create_table

Create the 'events' table.

=cut
