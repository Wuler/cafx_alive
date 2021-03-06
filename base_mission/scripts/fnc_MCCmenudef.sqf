#include <\x\alive\addons\sys_viewdistance\script_component.hpp>
#include <\x\cba\addons\ui_helper\script_dikCodes.hpp>

private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus"];
// _this==[_target, _menuNameOrParams]

PARAMS_2(_target,_params);

_menuName = "";
_menuRsc = "popup";

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__];};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};
//-----------------------------------------------------------------------------
/*
	["Menu Caption", "flexiMenu resource dialog", "optional icon folder", menuStayOpenUponSelect],
	[
	    ["caption", 
		"action", 
		"icon", 
		"tooltip", 
		{"submenu"|["menuName", "", {0|1} (optional - use embedded list menu)]}, 
		-1 (shortcut DIK code),
		{0|1/"0"|"1"/false|true} (enabled), 
		{-1|0|1/"-1"|"0"|"1"/false|true} (visible)
	    ],
	     ...
*/
_menus =
[
	[
		["main", "ALiVE", _menuRsc],
		[
			[" -= MCC =- ",
				{[] execvm "\mcc_sandbox_mod\mcc\dialogs\mcc_PopupMenu.sqf"},
				"",
				"",
		 		"",
		 		-1, 1, getplayerUID player in MCC_allowedPlayers || "all" in MCC_allowedPlayers || serverCommandAvailable "#logout" || isServer
			]
		]
	]
];


//-----------------------------------------------------------------------------
_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef; // return value
