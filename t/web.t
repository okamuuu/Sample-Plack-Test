#!/usr/bin/env perl
use strict;
use warnings;
use Test::Most;
use Plack::Test;
use HTTP::Request::Common qw/GET POST/;

use_ok('MyApp::Web::Handler');

my $app = MyApp::Web::Handler->app();

test_psgi $app, sub {
    my $cb  = shift;
    my $res = $cb->( GET "/" );

    is $res->code, 200;
    is $res->header('Content-Type'), 'text/plain';
    is $res->content, "hello, I'm okamuuu. Thank you!!";
};

test_psgi $app, sub {
    my $cb  = shift;
    my $res = $cb->( GET "/bye" );

    is $res->code, 200;
    is $res->header('Content-Type'), 'text/plain';
    is $res->content, "bye bye!!";
};


done_testing();
