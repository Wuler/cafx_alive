#ifndef execNow
#define execNow call compile preprocessfilelinenumbers
#endif

if (isHC) exitwith {};

//TPW
	0 = [] execvm "scripts\tpw\tpw_core.sqf";

	0 =
	[
	[50,500], // Min/max range of goggles
	[1,1,1], // HUD colour
	[0,1,1], // Friendly colour
	[1,0.5,0], // Enemy units colour
	[1,1,1], // Civ colour
	[0,1,0], // Squad and marker colour
	0.6, // Initial HUD brightness
	[1,0.4,0.4,1], // ASL where 1 = active ( 0 = inactive), 0.4 = X position, 0.4 = Y position, 1 = text size
	[1,0.5,0.4,1], // AZT
	[1,0.6,0.4,1], // GRD
	[1,0.4,0.5,1], // LMT
	[1,0.6,0.5,1], // TMP
	[1,0.4,0.6,1], // HLT
	[1,0.5,0.6,1], // RNG
	[1,0.6,0.6,1], // VEL
	[1,0.5,0.5,1], // PRX
	[1,1,0.25,0.5], // UNITS where 1 = active ( 0 = inactive), 1 = icon max size, 0.25 = icon min size, 0.5 = text size ( 1 = same size as HUD text)
	[0.03,0], //HUD offset [x,y] -1 to 1
	1, // HUD scale. > 1 = larger
	1, // Text scale. > 1 = larger
	1, // HUD distance degradation. 0 = no degradation
	0, // No HUD in 3rd person. 1 = HUD in 3rd person
	0, // Add TAC glasses to player's uniform if not present. 0 = don't add
	[24,23,30,29,24,23,30,29,22,20], // ICONS [unit,hidden unit,vehicle,hidden vehicle,enemy unit,hidden enemy unit,enemy vehicle,hidden enemy vehicle,marker,predictor]
	1.5, // Detection range multiplication factor for vehicles (1.5 = 750m max detection range for vehicles vs 500m for units)
	1 // Audible warning when enemies detected
	] execvm "scripts\tpw\tpw_hud.sqf";

if ((paramsarray select 47) > 0) then {
	0 = [30,800,5,5,1] execvm "scripts\tpw\tpw_cars.sqf";
	//0 = [30,900,2,[50,250,500],2] execvm "scripts\tpw\tpw_air.sqf";
	0 = [30,1000,5,2] execvm "scripts\tpw\tpw_boats.sqf";
	0 = [30,15,200,75,900] execvm "scripts\tpw\tpw_animals.sqf";
	0 = [5,150,15,1,4,50,0,5,15,1] execvm "scripts\tpw\tpw_civs.sqf";
};

//insurgency
if ((paramsarray select 0) == 1) then {

	#include "scripts\gridMarkers\functions\functions.sqf"
	#include "scripts\cacheScript\functions\cacheFunctions.sqf"
	#include "scripts\cacheScript\functions\cacheGetPositions.sqf"

	if (isServer || isDedicated) then {
		null = ["null"] execVM "scripts\gridMarkers\createMarkers.sqf";
	};

	execNow "scripts\cacheScript\cache.sqf";

	if (isServer || isDedicated) then {
		[] execVM "scripts\cacheScript\Functions\spawnIntel.sqf";
	};
};

//spawn base objects
[] execvm "init-map.sqf";

//Sac ventral
[] execvm "scripts\FSFSV_fnc_Core.sqf";

// player init
if(!isDedicated) then {

	//waituntil {!isnull player};

	player execvm "scripts\loadouts\spawnloadout.sqf";

	[] spawn {
		waituntil {sleep 1; !isnil "mcc_actionInedx"};
		player removeaction mcc_actionInedx;
	};

	[] execVM "scripts\briefing.sqf";

	[player,"CMBG"] call BIS_fnc_setUnitInsignia;

	//SATCOM
	[] execVM "scripts\pxs_satcom_a3\init_satellite.sqf";

	if (isnil "SATCOM") then {SATCOM = compile preprocessfilelinenumbers "scripts\pxs_satcom_a3\start_satellite.sqf"};

	//menus
	if (isnil "seven_serviceMenuDef") then {seven_serviceMenuDef = compile preprocessFileLineNumbers "functions\fnc_servicemenudef.sqf"};

	if (isnil "seven_adminMenuDef") then {seven_adminMenuDef = compile preprocessFileLineNumbers "functions\fnc_adminmenudef.sqf"};

	if (isnil "seven_ambienceMenuDef") then {seven_ambienceMenuDef = compile preprocessFileLineNumbers "functions\fnc_ambiencemenudef.sqf"};

	["player",[SELF_INTERACTION_KEY],-9903,["call seven_serviceMenuDef","main"]] call ALIVE_fnc_flexiMenu_Add;
	["player",[SELF_INTERACTION_KEY],-9905,["call seven_adminMenuDef","main"]] call ALIVE_fnc_flexiMenu_Add;
	["player",[SELF_INTERACTION_KEY],-9906,["call seven_ambienceMenuDef","main"]] call ALIVE_fnc_flexiMenu_Add;
	["player",[SELF_INTERACTION_KEY],9999,["functions\fnc_MCCmenudef.sqf","main"]] call ALIVE_fnc_flexiMenu_Add;

	//respawn stuff
    player addeventhandler ["respawn","
		player execvm 'scripts\loadouts\spawnloadout.sqf';

		[] spawn {
			waituntil {sleep 1; !isnil 'mcc_actionInedx'};
			player removeaction mcc_actionInedx;
		};"
	];
};


/*
if (isserver) exitwith {
	private ["_mishnames","_mishfiles","_smish"]

	_mishnames = profileNamespace getVariable "MCC_save";
	_mishfiles = profileNamespace getVariable "MCC_saveFiles";
	_smish = [_mishnames,_mishfiles];
	missionnamespace setvariable ["smish",_smish];

	"smish" addPublicVariableEventHandler {
		private["_mish"];
		_mish = _this select 1;
		profileNamespace setVariable ["MCC_save",_mish select 0];
		profileNamespace setVariable ["MCC_saveFiles",_mish select 1];
	};
};
*/