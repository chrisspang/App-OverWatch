package App::OverWatch::ServiceLock::postgres;

use strict;
use warnings;
use utf8;

use base 'App::OverWatch::ServiceLock';

sub create_table {
    my $self = shift;

    my $sql =<<'CREATESQL';
CREATE OR REPLACE FUNCTION update_mtime()
RETURNS TRIGGER AS $$
BEGIN
   NEW.mtime = now();
   RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TYPE dispatch_lock_status AS ENUM ( 'UNLOCKED', 'LOCKED' );

CREATE TABLE servicelocks (
    system    VARCHAR(50) PRIMARY KEY NOT NULL,
/*    `subsystem` VARCHAR(50) NOT NULL, */

    worker    VARCHAR(50) NOT NULL,

    status    dispatch_lock_status NOT NULL,

    mtime     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    /* Manager will reset lock after this time ... or we could just allow new locks to take it..? */
    expiry    TIMESTAMP DEFAULT NULL,

    text      VARCHAR(255) NOT NULL DEFAULT ''
);

CREATE TRIGGER update_servicelocks_mtime BEFORE UPDATE
ON servicelocks FOR EACH ROW EXECUTE PROCEDURE
update_mtime();
CREATESQL

    my $ret = $self->{DB}->dbix_run( $sql );
    return $ret;
}

sub timestamp_calculate_sql {
    my $self   = shift;
    my $expiry = shift;  # In minutes

    return 'NULL'
        if (!$expiry || $expiry !~ m/ ^ [0-9]+ $ /xms);

    return "NOW() + interval '$expiry minutes'";
}

sub generate_now_sql {
    my $self = shift;

    return "NOW()";
}

1;

=head1 NAME

App::OverWatch::ServiceLock::postgres - PostgreSQL backend for App::OverWatch::ServiceLock

=head1 METHODS

=head2 create_table

Create the 'servicelocks' table.

=head2 timestamp_calculate_sql

Return SQL to allow calculation of expiry times.

=head2 generate_now_sql

Return SQL for 'NOW()'.

=cut
