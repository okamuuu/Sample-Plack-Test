package MyApp::Web::Handler;
use strict;
use warnings;
use MyApp::Web::Router::Sinatraish;
use Plack::Request;

sub app {
    return sub {
        my $env = shift;

        my $router = MyApp::Web::Router::Sinatraish->router;
        my $route  = $router->match($env) or return [ 404, [], ['not found'] ];

        my $request = Plack::Request->new($env);
        my $response = $route->{code}->($request);

        return $response->finalize();
      };
}

1;

