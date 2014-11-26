private ["_anchorObject", "_anchorDim", "_objs","_br", "_tab", "_outputText","_mish"];
_anchorObject = _this;
_objs = allMissionObjects "All";

{
	//Exclude non-dynamic objects (world objects)
	if (getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "simulation") in ["soldier"] || (typeOf _x) in Ares_EditableObjectBlacklist || _x == _anchorObject) then {
		_objs set [_forEachIndex, -1];
	};
} forEach _objs;

_objs = _objs - [-1];

//Formatting for output
_br = toString [13, 10];
_tab = toString [9];

// Start the output
_outputText = "[";

//Process non-filtered objects
_objectsToSave = [];
{
	private ["_type", "_objPos", "_dX", "_dY", "_z", "_azimuth", "_fuel", "_damage", "_outputArray"];
	_type = typeOf _x;
	_objPos = getPosWorld _x;
	_xPos = _objPos select 0;
	_yPos = _objPos select 1;
	_zPos = _objPos select 2;
	_azimuth = direction _x;
	_fuel = fuel _x;
	_damage = damage _x;

	_outputArray = [_type, [_xPos, _yPos, _zPos], _azimuth, _fuel, _damage];
	_outputText = _outputText + (str _outputArray);
	_outputText = _outputText + ",";
} forEach _objs;

// Add an entry for holding the anchor position and version number. This will be extracted if we want to do a relative paste later.
_outputText = _outputText + format ["[%1,%2,%3],[1]", (getPosWorld _anchorObject) select 0,  (getPosWorld _anchorObject) select 1, (getPosWorld _anchorObject) select 2] + "]";

_mish = format ["ares_%1",worldname];
profilenamespace setvariable [_mish,_outputtext];

_outputText