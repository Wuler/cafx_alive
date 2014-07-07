/*
	script name:		Usable Cargo Ramp fo CH-49 Mohawk
	description:		Open and close the cargo ramp, get in and get out using cargo ramp (action menu). Adds lights audio signals in the cargo compartment, for parachuting (or whatever you want). Adds the "get out to the left side action.
	version:			v2.3
	author:				Zigomarvin
	official thread:	http://forums.bistudio.com/showthread.php?169340-Usable-cargo-ramp-for-CH-49-Mohawk
	
	Changelog:
	
	v2.3 - 04/18/2014
		fixed a bug produced buy the previous fix...
	
	v2.2 - 04/18/2014
		fixed a bug
	
	v2.1 - 04/16/2014
		New cargo ramp positions: closed, slightly open, drop position, open.
		Pilot can turn on lights of colours or play signal sounds in the cargo compartment.
		Co-pilot now can handle cargo ramp, new lights and new sounds.
		You can get out to the left side.
	
	v2.0 - never released
		New system (no longer ammo box, all in one file, less bugs (maybe no more)...).
	
	v1.1 - 12/05/2013
		FIXED: script wasn't started correctly when the server had many things to load.
		FIXED: "get out" action is no longer removed when the chopper get full.
		Added some priorities in actions.
	
	v1.0 - 12/01/2013
		release
	
	how to use:
		1. if you are already using an older version of this script, remove the "usableCargoRamp" folder which is in "scripts" folder
		2. copy/paste the "scripts" folder in your mission root
		3. open the description.ext and copy the CfgSounds class in your mission description.ext
		4. put this in your CH-49 init field: _n = [this] execVM "scripts\usableCargoRamp\usableCargoRamp.sqf";
*/





//////////////////////////////////////////////////
//////////////////// settings ////////////////////
//////////////////////////////////////////////////

_heli = _this select 0;

if !(typeOf _heli in ["CH_147F"]) exitWith {};


////////////////////////////////////////////////
//////////////////// server ////////////////////
////////////////////////////////////////////////

if (isServer) then {
	waitUntil {!isNull _heli};

	_heli setVariable ["lightStatus", "off", true]; // by default, the light is turned off
	_heli setVariable ["gunner", nil, true]; // seems "gunner _heli" doesn't works so this variable is used to store the co-pilot when this one get in
};

if (isDedicated) exitWith {};





//////////////////////////////////////////////
//////////////////// misc ////////////////////
//////////////////////////////////////////////

// remove all action
chinook_fnc_clientRemoveAllActions = {
	private ["_unit", "_veh", "_array", "_actionsToRemove"];
	
	_unit = _this select 0;
	_veh = _this select 1;
	_array = _this select 2;
	
	_actionsToRemove = _veh getVariable _array;
	
	{
		_unit removeAction _x;
	} forEach _actionsToRemove;
	
	_veh setVariable [_array, [], false];
};

// update actions-to-remove array
chinook_fnc_updateActionsToRemoveArray = {
	private ["_heli", "_id", "_array", "_actionsToRemove"];
	
	_heli = _this select 0;
	_id = _this select 1;
	_array = _this select 2;
	
	_actionsToRemove = _heli getVariable _array;
	[_actionsToRemove, _id] call BIS_fnc_arrayPush;
	_heli setVariable [_array, _actionsToRemove, false];
};

// check some conditions to add the action
chinook_fnc_ifPlayerIsNearFromChopper = {
	private ["_heli", "_player", "_return", "_isWater", "_pos"];
	
	_heli = _this select 0;
	_player = _this select 1;
	_return = false;
	
	_return
};

// format action text in right language
chinook_fnc_actionText = {
	private ["_action", "_language", "_color", "_ramp", "_light", "_signal", "_cargo", "_text"];
	
	_action = _this select 0;
	_language = language;
	_color = "FFFFFF";
	_ramp = "CC2639";
	_light = "EC7724";
	_signal = "90B193";
	_cargo = "28649E";
	_text = "";
	
	switch (_action) do {
		
		// lights off
		case "off": {
			_color = _light;
			
			switch (_language) do {
				case "French": {_text = "Lumière - éteinte"};
				default {_text = "light - turned off"};
			};
		};
		
		// white light
		case "white": {
			_color = _light;
			
			switch (_language) do {
				case "French": {_text = "Lumière - blanche"};
				default {_text = "Light - white"};
			};
		};
		
		// red light
		case "red": {
			_color = _light;
			
			switch (_language) do {
				case "French": {_text = "Lumière - rouge"};
				default {_text = "Light - red"};
			};
		};
		
		// green light
		case "green": {
			_color = _light;
			
			switch (_language) do {
				case "French": {_text = "Lumière - verte"};
				default {_text = "Light - green"};
			};
		};
		
		// prepare sound
		case "prepare": {
			_color = _signal;
			
			switch (_language) do {
				case "French": {_text = "Signal - préparation"};
				default {_text = "Signal - prepare"};
			};
		};
		
		// go sound
		case "go": {
			_color = _signal;
			
			switch (_language) do {
				case "French": {_text = "Signal - go"};
				default {_text = "Signal - go"};
			};
		};
	};
	
	format ["<t color='#%1'>%2</t>", _color, _text]
};

chinook_fnc_clientGetCrew = {
	private ["_heli", "_crew", "_driver", "_gunner"];
	
	_heli = _this select 0;
	_crew = [];
	_driver = driver _heli;
	_gunner = _heli getVariable "gunner";
	
	if (!isNull _driver) then {
		[_crew, _driver] call BIS_fnc_arrayPush;
	};
	
	if (!isNil "_gunner") then {
		[_crew, _gunner] call BIS_fnc_arrayPush;
	};
	
	_crew
};





////////////////////////////////////////////////
//////////////////// lights ////////////////////
////////////////////////////////////////////////

// create lights objects on player connection
chinook_fnc_clientCreateLightsObjects = {
	private ["_heli", "_lights", "_lightsPositions", "_light", "_lightParams", "_brightness", "_color"];
	
	_heli = _this select 0;
	_lights = [];
	_lightsPositions = [[0.13, -1.26, -1], [0.13, 1.75, -1]];
	
	{
		_light = "#lightpoint" createVehicleLocal getPos _heli;
		[_lights, _light] call BIS_fnc_arrayPush;
		_light attachTo [_heli, _x];
		_light setLightAttenuation [1, 0, 0, 7.5];
	} forEach _lightsPositions;
	
	_heli setVariable ["lights", _lights, false];
	
	[_heli, _heli getVariable "lightStatus"] call chinook_fnc_clientSetLightColor;
	
	_lights
};

// set light color
chinook_fnc_clientSetLightColor = {
	private ["_heli", "_newLightStatus", "_lights", "_lightParams", "_brightness", "_color"];
	
	_heli = _this select 0;
	_newLightStatus = _this select 1;
	_lights = _heli getVariable "lights";
	_lightParams = [_newLightStatus] call chinook_fnc_clientLightStatusDecode;
	_brightness = _lightParams select 0;
	_color = _lightParams select 1;
	
	{
		_x setLightBrightness _brightness;
		_x setLightColor _color;
	} forEach _lights;
};

// convert light status ("off", "red"...) as light params ([0, [0, 0, 0]], [0.2, [1, 0, 0]]...)
chinook_fnc_clientLightStatusDecode = {
	private ["_newLightStatus", "_lightParams"];
	
	_newLightStatus = _this select 0;
	_lightParams = [];
	
	switch (_newLightStatus) do {
		case "white" : {_lightParams = [0.1, [1, 1, 1]]};
		case "red" : {_lightParams = [0.1, [1, 0, 0]]};
		case "green" : {_lightParams = [0.1, [0, 1, 0]]};
		case "off" : {_lightParams = [0, [0, 0, 0]]};
	};
	
	_lightParams
};

// create light action for the pilot (and copilot soon)
chinook_fnc_clientCreateLightAction = {
	private ["_unit", "_heli", "_lightStatus", "_lightParams", "_id"];
	
	_unit = _this select 0;
	_heli = _this select 1;
	_lightStatus = _this select 2;
	_condition = format ["vehicle _target getVariable 'lightStatus' != '%1'", _lightStatus];
	
	_id = _unit addAction [
		[_lightStatus] call chinook_fnc_actionText,
		"call chinook_fnc_clientLightManager",
		[_heli, _lightStatus],
		6.09,
		false,
		true,
		"",
		_condition
	];
	
	[_heli, _id, "lightActionsToRemove"] call chinook_fnc_updateActionsToRemoveArray;
};

// light manager
chinook_fnc_clientLightManager = {
	private ["_unit", "_heli", "_lightStatus"];
	
	_unit = _this select 1;
	_heli = (_this select 3) select 0;
	_lightStatus = (_this select 3) select 1;
	
	_heli setVariable ["lightStatus", _lightStatus, true];
	[[_heli, _lightStatus], "chinook_fnc_clientSetLightColor", nil, false] spawn BIS_fnc_MP;
};


///////////////////////////////////////////////
//////////////////// sound ////////////////////
///////////////////////////////////////////////

// create sound action
chinook_fnc_clientCreateSignalAction = {
	private ["_unit", "_heli", "_signal", "_condition", "_id"];
	
	_unit = _this select 0;
	_heli = _this select 1;
	_signal = _this select 2;
	
	_id = _unit addAction [
		[_signal] call chinook_fnc_actionText,
		"call chinook_fnc_clientSignalManager",
		[_heli, _signal],
		6.09,
		false,
		true,
		"",
		""
	];
	
	[_heli, _id, "signalActionsToRemove"] call chinook_fnc_updateActionsToRemoveArray;
};

// signal 
chinook_fnc_clientSignalManager = {
	private ["_unit", "_heli", "_doorStatus"];
	
	_heli = (_this select 3) select 0;
	_signal = (_this select 3) select 1;
	
	[[_signal], "chinook_fnc_clientSignalForCrew", crew _heli, false] spawn BIS_fnc_MP;
};

chinook_fnc_clientSignalForCrew = {
	private ["_signal", "_missionPath", "_soundPath"];
	
	_signal = _this select 0;
	_missionPath = [str missionConfigFile, 0, -15] call BIS_fnc_trimString;
	_soundPath = _missionPath + format ["\caf_ch148\scripts\usableCargoRamp\sounds\alarm-%1.ogg", _signal];
	
	playSound format ["alarm_%1", _signal];
};




//////////////////////////////////////////////////////////////////
//////////////////// get out to the left side ////////////////////
//////////////////////////////////////////////////////////////////

// get out to the left side
chinook_fnc_getOutLeftCargoRamp = {
	private ["_unit", "_heli", "_d", "_outPos"];

	_unit = _this select 1;
	_heli = (_this select 3) select 0;
	
	_unit disableCollisionWith _heli;
	_unit action ["Eject", _heli];
	waitUntil {vehicle _unit == _unit};
	
	_outPos = _heli modelToWorld [-3.13187, 4.77741, -3.33367];
	_unit setPosATL _outPos;
	_unit setDir ((getDir _heli) + -90);
	_unit enableCollisionWith _heli;
};





////////////////////////////////////////////////
//////////////////// client ////////////////////
////////////////////////////////////////////////

waitUntil {!isNull player};
waitUntil {!isNull _heli};

_heli setVariable ["lightActionsToRemove", [], false];
_heli setVariable ["signalActionsToRemove", [], false];

waitUntil {
	sleep 0.1;
	_var = _heli getVariable "lightStatus";
	!isNil "_var";
};

_lights = [_heli] call chinook_fnc_clientCreateLightsObjects;


/////////////////////////////////////////////////
//////////////////// actions ////////////////////
/////////////////////////////////////////////////


// on get in
_heli addEventHandler ["GetIn", {
	_heli = _this select 0;
	_pos = _this select 1;
	_unit = _this select 2;
	
	if (local _unit) then {
		_lightStatus = _heli getVariable "lightStatus";
		
		if (_pos == "driver" || _pos == "gunner") then {
			
			if (_pos == "gunner") then {
				_heli setVariable ["gunner", _unit, true];
			};
			
			[_unit, _heli, "off"] call chinook_fnc_clientCreateLightAction;
			[_unit, _heli, "white"] call chinook_fnc_clientCreateLightAction;
			[_unit, _heli, "red"] call chinook_fnc_clientCreateLightAction;
			[_unit, _heli, "green"] call chinook_fnc_clientCreateLightAction;
			
			[_unit, _heli, "prepare"] call chinook_fnc_clientCreateSignalAction;
			[_unit, _heli, "go"] call chinook_fnc_clientCreateSignalAction;
		};
	};	
}];

// on get out, remove actions
_heli addEventHandler ["GetOut", {
	_heli = _this select 0;
	_pos = _this select 1;
	_unit = _this select 2;
	
	if (local _unit) then {
		if (_pos == "gunner") then {
			_heli setVariable ["gunner", nil, true];
		};
		[_unit, _heli, "lightActionsToRemove"] call chinook_fnc_clientRemoveAllActions;
		[_unit, _heli, "signalActionsToRemove"] call chinook_fnc_clientRemoveAllActions;
	};
}];
	
// on player killed, eject unit (free the seat) and remove actions
_playerEventHandler = player addEventHandler ["Killed", {
	_unit = _this select 0;
	_veh = vehicle _unit;
	
	if (_veh != _unit && typeOf _veh in ["CH_147F"] && !isnil {_veh getVariable "doorStatus"}) then {
		_unit action ["Eject", _veh];
		
		[_unit, _veh, "lightActionsToRemove"] call chinook_fnc_clientRemoveAllActions;
		[_unit, _veh, "signalActionsToRemove"] call chinook_fnc_clientRemoveAllActions;
	};
}];

// delete everything when chopper get destroyed
_heli addEventHandler ["Killed", {
	_heli = _this select 0;
	_ligths = _heli getVariable "lights";
	
	{
		deleteVehicle _x;
	} forEach _ligths;
	[player, _heli, "lightActionsToRemove"] call chinook_fnc_clientRemoveAllActions;
	[player, _heli, "signalActionsToRemove"] call chinook_fnc_clientRemoveAllActions;
}];

// delete lights if chopper get removed
if (!isDedicated) then {
	waitUntil {sleep 15; isNull _heli};
	
	{
		deleteVehicle _x;
	} forEach _lights;
	
	player removeEventHandler ["killed", _playerEventHandler];
};