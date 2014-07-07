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
			["7CMBG Admin >",
				"",
				"",
				"",
                ["call seven_adminMenuDef", "admin", 1],
                -1, 1, call ALIVE_fnc_isServerAdmin
			]
		]
	]
];

if (_menuName == "admin") then {
	_menus set [count _menus,
		[
			["admin", "7CMBG Admin", "popup"],
				[
					["Neutral friendly to BLUFOR",
						{resistance setFriend [west, 1]; west setfriend [resistance,1]},
						"",
						"",
						"",
						-1,
						1,
						true
					],
					["Neutral hostile to BLUFOR",
						{resistance setFriend [west, 0]; west setfriend [resistance,0]},
						"",
						"",
						"",
						-1,
						1,
						true
					],
					["Neutral friendly to OPFOR",
						{resistance setFriend [east, 1]; east setfriend [resistance,1]},
						"",
						"",
						"",
						-1,
						1,
						true
					],
					["Neutral hostile to OPFOR",
						{resistance setFriend [east, 0]; east setfriend [resistance,0]},
						"",
						"",
						"",
						-1,
						1,
						true
					],
					["Activate Car Bombers",
						{[[], "karma_carbombstart", true, true] spawn BIS_fnc_MP},
						"",
						"",
						"",
						-1,
						1,
						true
					],
					["Activate IEDs",
						{[[], "epd_init", true, true] spawn BIS_fnc_MP},
						"",
						"",
						"",
						-1,
						1,
						true
					],
					["Activate Sleepers",
						{[[], "ws_assassins", true, true] spawn BIS_fnc_MP},
						"",
						"",
						"",
						-1,
						1,
						true
					],
					["PAUSE CIVS",
						{["ALIVE_AMB_CIV_POPULATION"] call ALiVE_fnc_pauseModule},
						"",
						"",
						"",
						-1,
						1,
						true
					],
					["PAUSE CQB",
						{["ALIVE_MIL_CQB"] call ALiVE_fnc_pauseModule},
						"",
						"",
						"",
						-1,
						1,
						true
					],
					["RESUME CIVS",
						{["ALIVE_AMB_CIV_POPULATION","ALIVE_MIL_CQB"] call ALiVE_fnc_unpauseModule},
						"",
						"",
						"",
						-1,
						1,
						true
					],
					["RESUME CQB",
						{["ALIVE_MIL_CQB"] call ALiVE_fnc_unpauseModule},
						"",
						"",
						"",
						-1,
						1,
						true
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