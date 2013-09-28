%%%-------------------------------------------------------------------
%%% @author Anton I Alferov <casper@ubca-dp>
%%% @copyright (C) 2013, Anton I Alferov
%%%
%%% Created: 28 Sep 2013 by Anton I Alferov <casper@ubca-dp>
%%%-------------------------------------------------------------------

-module(mime).

-export([start/0, stop/0]).
-export([type/1]).

-include("mime_config.hrl").

start() -> application:start(?MODULE).
stop() -> application:stop(?MODULE).

type(Extension) -> case ets:lookup(?DbName, Extension) of
	[{Extension, Type}|_] -> {ok, Type}; [] -> {error, not_found} end.
