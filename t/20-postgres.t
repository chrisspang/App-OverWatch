
use strict;
use warnings;

use App::OverWatch;

use Test::More;

eval {
    require DBD::Pg;
};
if ($@) {
    plan skip_all => "Warning: Couldn't load DBD::Pg - Skipping postgres test";
}

plan tests => 1;

use_ok("DBD::Pg");

my $config = get_test_config('sqlite');

note $config;

use_ok("DBD::SQLite");

my $ServiceLock = get_servicelock($config);

run_servicelock_tests($ServiceLock);

done_testing();
