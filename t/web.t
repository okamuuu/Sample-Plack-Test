use strict;
use warnings;
use Test::Most;
use Plack::Test;
use HTTP::Request::Common qw/GET POST/;

my $app = sub {
    return [
        200, [ "Content-Type" => "text/plain", "Content-Length" => 31 ],
        ["hello, I'm okamuuu. Thank you!!"]
    ];
};

test_psgi $app, sub {
    my $cb  = shift;
    my $res = $cb->( GET "/" );

    use Data::Dumper;
    warn Dumper $res;

    is $res->code, 200;
    is $res->header('Content-Type'), 'text/plain';
    is $res->content, "hello, I'm okamuuu. Thank you!!";
};

done_testing();
