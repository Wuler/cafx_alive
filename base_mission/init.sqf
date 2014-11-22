#ifndef execNow
#define execNow call compile preprocessfilelinenumbers
#endif

if (name player == "hc") exitwith {};

/*
MCC_START_WEST = getmarkerpos "respawn_west";

if (isserver) then {
	[getmarkerpos 'respawn_west', 0, 'west','HQ',false] call CP_fnc_buildspawnpoint
};
*/

execNow "init-vas.sqf";

[] execvm "init-mcc.sqf";

execNow "init-custom.sqf";

