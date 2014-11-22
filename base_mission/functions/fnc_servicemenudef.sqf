#include <\x\alive\addons\sys_viewdistance\script_component.hpp>
#include <\x\cba\addons\ui_helper\script_dikCodes.hpp>

private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus", "_heloservice", "_vehservice","_loadoutservice"];

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
			["7CMBG Service >",
				"",
				"",
				"",
                ["call seven_serviceMenuDef", "sevenservice", 1],
                -1, 1, true
			]
		]
	]
];

_heloservice = ["Heli_H","Land_HelipadSquare_F","Land_HelipadCircle_F"];
_vehservice = ["USMC_WarfareBVehicleServicePoint","US_WarfareBVehicleServicePoint_EP1","US_WarfareBVehicleServicePoint_Base_EP1"];
_loadoutservice = _heloservice + _vehservice + [];

if (_menuName == "sevenservice") then {
	_menus set [count _menus,
		[
			["sevenservice", "Service Menu", "popup"],
				[
					["Vehicle Service",
						{[] execvm "scripts\rearmvehicle.sqf"},
						"",
						"Move close to service point and shutdown engine to service vehicle",
						"",
						-1, !isEngineOn (vehicle player) && count ([player, _vehservice, 15] call CBA_fnc_getNearest) > 0, vehicle player isKindOf "Car"
					],
					["Helicopter Service",
						{[] execvm "scripts\rearmchopper.sqf"},
						"",
						"Move on helipad and shutdown engine to service chopper",
						"",
						-1, !isEngineOn (vehicle player) && count ([player, _heloservice, 15] call CBA_fnc_getNearest) > 0, vehicle player isKindOf "Air"
					],
					["Load Infantry box",
						{[1] execvm "scripts\loadouts\vehloadouts.sqf"},
						"",
						"Load infantry gear in vehicle",
						"",
						-1,1, (vehicle player) != player && count ([player, _loadoutservice, 15] call CBA_fnc_getNearest) > 0
					],
					["Load Weapons box",
						{[2] execvm "scripts\loadouts\vehloadouts.sqf"},
						"",
						"Load heavy weapons in vehicle",
						"",
						-1,1, (vehicle player) != player && count ([player, _loadoutservice, 15] call CBA_fnc_getNearest) > 0
					],
					["Load Medical box",
						{[3] execvm "scripts\loadouts\vehloadouts.sqf"},
						"",
						"Load medical gear in vehicle",
						"",
						-1,1, (vehicle player) != player && count ([player, _loadoutservice, 15] call CBA_fnc_getNearest) > 0
					],
					["RTB",
						{player setpos getmarkerpos "respawn_west"},
						"",
						"Return player to spawn marker",
						"",
						-1,1, true
					],
					["Satellite COMs",
						{ call SATCOM },
						"",
						"",
				 		"",
				 		-1,1, true
					],
					["Backpack to chest",
						{0 spawn FSFSV_CallBackpackToFront},
						"",
						"",
						"",
						-1,1, (call FSFSV_TestPlayerBackpackBack) > 0
					],
					["Backpack to back",
						{0 spawn FSFSV_CallBackpackToBack},
						"",
						"",
						"",
						-1,1, (call FSFSV_TestPlayerBackpackFront) > 0
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