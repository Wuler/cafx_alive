private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus"];
// _this==[_target, _menuNameOrParams]

//PARAMS_2(_target,_params);

_target = _this select 0;
_params = _this select 1;

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
			["7CMBG Player >",
				"",
				"",
				"",
                ["call seven_playerMenuDef", "sevenplayer", 1],
                -1, 1, true
			]
		]
	]
];

if (_menuName == "sevenplayer") then {
	_menus set [count _menus,
		[
			["sevenplayer", "7CMBG Player", "popup"],
				[
					["Squad Management",
						{call squadmgt},
						"",
						"",
				 		"",
				 		-1, 1, true
					],
					["Mark position",
						{call playermark},
						"",
						"",
						"",
						-1,1,true
					],
					["Backpack on chest",
						{0 spawn FSFSV_CallBackpackToFront},
						"",
						"",
						"",
						-1,1,call FSFSV_TestPlayerBackpackBack
					],
					["Backpack on back",
						{0 spawn FSFSV_CallBackpackToBack},
						"",
						"",
						"",
						-1,1,call FSFSV_TestPlayerBackpackFront
					]
				]
			]
		];
};

//-----------------------------------------------------------------------------
_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef // return value