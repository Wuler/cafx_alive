#include <\x\alive\addons\sys_viewdistance\script_component.hpp>
#include <\x\cba\addons\ui_helper\script_dikCodes.hpp>

private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus"];

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

_menus =
[
	[
		["main", "ALiVE", _menuRsc],
		[
			["Player Ambience >",
				"",
				"",
				"",
                ["call seven_ambienceMenuDef", "ambience", 1],
                -1, 1, (paramsarray select 47) > 0
			]
		]
	]
];

if (_menuName == "ambience") then {
	_menus set [count _menus,
		[
			["ambience", "Ambience Menu (clientside)", "popup"],
				[
					["Enable Civilians",
						{ tpw_civ_active = true },
						"",
						"",
				 		"",
				 		-1, 1, !isnil "tpw_civ_active" && !tpw_civ_active
					],
					["Enable Animals",
						{ tpw_animal_active = true },
						"",
						"",
				 		"",
				 		-1, 1, !isnil "tpw_animal_active" && !tpw_animal_active
					],
					["Enable Cars",
						{ tpw_car_active = true },
						"",
						"",
				 		"",
				 		-1, 1, !isnil "tpw_car_active" && !tpw_car_active
					],
					["Enable Boats",
						{ tpw_boat_active = true },
						"",
						"",
				 		"",
				 		-1, 1, !isnil "tpw_boat_active" && !tpw_boat_active
					],
					["Disable Civilians",
						{ tpw_civ_active = false },
						"",
						"",
				 		"",
				 		-1, 1, !isnil "tpw_civ_active" && tpw_civ_active
					],
					["Disable Animals",
						{ tpw_animal_active = false },
						"",
						"",
				 		"",
				 		-1, 1, !isnil "tpw_animal_active" && tpw_animal_active
					],
					["Disable Cars",
						{ tpw_car_active = false },
						"",
						"",
				 		"",
				 		-1, 1, !isnil "tpw_car_active" && tpw_car_active
					],
					["Disable Boats",
						{ tpw_boat_active = false },
						"",
						"",
				 		"",
				 		-1, 1, !isnil "tpw_boat_active" && tpw_boat_active
					]
				]
			]
		];
};

_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef