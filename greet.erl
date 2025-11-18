// Erlang (alternative file)
-module(greet).
-export([hello/0, greet/1]).

hello() ->
    io:format("Hello, World!~n").

greet(Name) ->
    io:format("Hello, ~s!~n", [Name]).
