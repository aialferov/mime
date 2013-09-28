%%%-------------------------------------------------------------------
%%% @author Anton I Alferov <casper@ubca-dp>
%%% @copyright (C) 2013, Anton I Alferov
%%%
%%% Created: 28 Sep 2013 by Anton I Alferov <casper@ubca-dp>
%%%-------------------------------------------------------------------

-module(mime_sup).
-behaviour(supervisor).

-export([start_link/1]).
-export([init/1]).

start_link(Args) -> supervisor:start_link(?MODULE, Args).

init(Args) -> {ok, {{one_for_one, 1, 10}, [
	{mime, {mime_server, start_link, [Args]},
	permanent, 10, worker, [mime_server]}
]}}.
