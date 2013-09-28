%%%-------------------------------------------------------------------
%%% Created: 28 Sep 2013 by Anton I Alferov <casper@ubca-dp>
%%%-------------------------------------------------------------------

{application, mime, [
	{id, "mime"},
	{vsn, "0.0.1"},
	{description, "MIME types server"},
	{modules, [mime, mime_app, mime_sup, mime_server]},
	{registered, [mime_server]},
	{applications, [kernel, stdlib, sasl, utils]},
	{mod, {mime_app, []}}
]}.
