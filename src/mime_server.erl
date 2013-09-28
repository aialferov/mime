%%%-------------------------------------------------------------------
%%% @author Anton I Alferov <casper@ubca-dp>
%%% @copyright (C) 2013, Anton I Alferov
%%%
%%% Created: 28 Sep 2013 by Anton I Alferov <casper@ubca-dp>
%%%-------------------------------------------------------------------

-module(mime_server).
-behaviour(gen_server).

-export([start_link/1]).

-export([init/1, terminate/2, code_change/3]).
-export([handle_call/3, handle_cast/2, handle_info/2]).

-include("mime_config.hrl").

-define(DefaultCharset, "utf8").
-define(DbOptions, [set, named_table]).

start_link(_Args) -> gen_server:start_link(?MODULE,
	utils_app:get_env([default_charset]), []).

init([]) -> init([{default_charset, ?DefaultCharset}]);
init([{default_charset, Charset}]) ->
	ets:new(?DbName, ?DbOptions),
	ets:insert(?DbName, lists:foldl(fun({Extension, Type}, Acc) -> Acc ++
		[{Ext, type(Type, Charset)} || Ext <- string:tokens(Extension, ", ")]
	end, [], ?MimeTypes)),
	{ok, []}.

handle_call(_Request, _From, State) -> {reply, ok, State}.
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.
code_change(_OldVsn, State, _Extra) -> {ok, State}.

type(Type = "application" ++ _, Charset) ->
	Type ++ "; charset=\"" ++ Charset ++ "\"";
type(Type = "text" ++ _, Charset) ->
	Type ++ "; charset=\"" ++ Charset ++ "\"";

type(Type, _Charset) -> Type ++ "; charset=\"binary\"".
