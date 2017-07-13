-module(structures_handler).

-export([init/2]).
-export([content_types_provided/2]).

-export([to_html/2]).
-export([to_json/2]).
-export([to_text/2]).

init(Req, Opts) ->
    {cowboy_rest, Req, Opts}.

content_types_provided(Req, State) ->
    {[
        {<<"text/html">>, to_html},
        {<<"application/json">>, to_json},
        {<<"text/plain">>, to_text}
    ], Req, State}.

to_html(Req, State) ->
    Body = <<"
        <html>
        <head>
            <meta charset=\"utf-8\">
            <title>REST Structures Resource!</title>
        </head>
        <body>
            <p>REST Structures Resource as HTML!</p>
        </body>
        </html>
    ">>,
    {Body, Req, State}.

to_json(Req, State) ->
    Body = <<"{\"rest\": \"Structures Resource!\"}">>,
    {Body, Req, State}.

to_text(Req, State) ->
    {<<"REST Structures Resource as text!">>, Req, State}.