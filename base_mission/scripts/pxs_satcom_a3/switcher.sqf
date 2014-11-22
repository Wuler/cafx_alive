//the function to switch on/off of SATCOM system
//[unitName, activeStatus] call PXS_switcher
//unitName - the unit for SATCOM action
//activeStatus - true or false
//v1.0 A3

private ["_status"];
_status = [_x, 1, true] call BIS_fnc_param;

if !(_status) then {
	call PXS_closeCamera;
	hint localize "SATCOM system is disconnected.";
};