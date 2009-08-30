use strict;
use Test::More;

use Data::Verifier;
use Moose::Util::TypeConstraints;

{
    my $verifier = Data::Verifier->new(
        profile => {
            age    => {
                type => 'Int'
            },
            age2    => {
                type => 'Int',
            }
        }
    );

    my $results = $verifier->verify({ age => 'foo', age2 => '12' });

    ok(!$results->success, 'failed');
    cmp_ok($results->invalid_count, '==', 1, '1 invalid');
    ok(defined($results->is_invalid('age')), 'age is invalid');
}

done_testing;