%%%-------------------------------------------------------------------
%%% @author Anton I Alferov <casper@ubca-dp>
%%% @copyright (C) 2013, Anton I Alferov
%%%
%%% Created: 28 Sep 2013 by Anton I Alferov <casper@ubca-dp>
%%%-------------------------------------------------------------------

-module(mime_app).
-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, StartArgs) -> mime_sup:start_link(StartArgs).
stop(_State) -> ok.
