package MyApp::Web::Router::Sinatraish;
use strict;
use warnings;
use Router::Simple::Sinatraish;

get '/' => sub { 
    my $request = shift;
    my $response = $request->new_response(200);

    $response->content_type('text/plain');
    $response->body("hello, I'm okamuuu. Thank you!!");

    return $response;
};

get '/bye' => sub {
    my $request = shift;
    my $response = $request->new_response(200);

    $response->content_type('text/plain');
    $response->body("bye bye!!");

    return $response;
};

1;

