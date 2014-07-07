#ifndef execNow
#define execNow call compile preprocessfilelinenumbers
#endif

execNow "support\modules\R3F_logistics\init.sqf";

[] execVM "support\modules\DOM_squad\init.sqf";

execNow "support\modules\tup_logistics\main.sqf";
[] execVM "scripts\pxs_satcom_a3\init_satellite.sqf";

if ((paramsarray select 47) == 1) then {[250,600,1,2,6,[0,1,1],player,[0.2,0.3,0.1,0.55,0.25,1,1,0.25,1,1],0,700,nil,["AWARE","SAD"],false] execVM "LV\ambientCombat.sqf";};

CODEINPUT = [];
CODE = [(round(random 9)), (round(random 9)), (round(random 9)), (round(random 9)), (round(random 9)), (round(random 9))];
WIRE = ["BLUE", "WHITE", "YELLOW", "GREEN"] call bis_fnc_selectRandom;
DEFUSED = false;
ARMED = false;

//karma_cb_map_center = _logic;
karma_cb_cbombprob = 5;
karma_cb_maxbombcount = 1;
karma_cb_civtrafcount = 8;
karma_cb_maxplayerdis = 1000;
karma_cb_mapscansize = 5000;
karma_cb_debug = 0;

if (isnil "karma_carbombstart") then {karma_carbombstart = compile preprocessFileLineNumbers "scripts\karma_carbomb_module\karma_carbomb_start.sqf"};

if (isnil "ws_assassins") then {ws_assassins = compile preprocessFileLineNumbers "scripts\ws_assassins.sqf"};

if (isnil "epd_init") then {epd_init = compile preprocessFileLineNumbers "EPD\Ied_Init.sqf"};

if (isnil "seven_playerMenuDef") then {seven_playerMenuDef = compile preprocessFileLineNumbers "scripts\fnc_playermenudef.sqf"};

if (isnil "seven_supportMenuDef") then {seven_supportMenuDef = compile preprocessFileLineNumbers "scripts\fnc_supportmenudef.sqf"};

if (isnil "seven_adminMenuDef") then {seven_adminMenuDef = compile preprocessFileLineNumbers "scripts\fnc_adminmenudef.sqf"};

if (isnil "SATCOM") then {SATCOM = compile preprocessfilelinenumbers "scripts\pxs_satcom_a3\start_satellite.sqf"};

if (isnil "squadmgt") then {squadmgt = compile preprocessFileLineNumbers "support\modules\DOM_squad\open_dialog.sqf"};

if (isnil "squadcommand") then {squadcommand = compile preprocessFileLineNumbers "scripts\squadcommand.sqf"};

if (isnil "playermark") then {playermark = compile preprocessFileLineNumbers "scripts\playermark.sqf"};

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

// player init

if(!isDedicated && !isHC) exitWith {

	// menu actions
    
	["player",[SELF_INTERACTION_KEY],-9903,["call seven_playerMenuDef","main"]] call ALIVE_fnc_flexiMenu_Add;
	["player",[SELF_INTERACTION_KEY],-9904,["call seven_supportMenuDef","main"]] call ALIVE_fnc_flexiMenu_Add;
	["player",[SELF_INTERACTION_KEY],-9905,["call seven_adminMenuDef","main"]] call ALIVE_fnc_flexiMenu_Add;
    
    [] spawn {
        waituntil {sleep 1; !isnil "mcc_actionInedx"};
    	player removeaction mcc_actionInedx;
		["player",[SELF_INTERACTION_KEY],-9906,["scripts\fnc_MCCmenudef.sqf","main"]] call ALIVE_fnc_flexiMenu_Add;
	};
	
	//Sac Ventral
	player setVariable ["FSFSV_BACKPACK",objNull];

	#include "scripts\FSFSV_fnc_Core.sqf"
};


// server init

// object network updater
[] spawn {
        while {true} do {
		private ["_i","_t"];
//		_i = 0;
		_t = time + 60;
                {
                        if (simulationEnabled _x) then {
                                _x enableSimulation false;
//								_i = _i + 1;

                                if (((typeOf _x) in ["HeliHEmpty"])) exitWith {};

                                _x addEventHandler ["Hit", "(_this select 0) enableSimulation true;"];

                                //player sideChat format ["OBJ: %1", _object];
                        };

			if(time > _t) exitWith {};

                } forEach (((allMissionObjects "Static") + (allMissionObjects "Thing")) - (allMissionObjects "ThingEffect"));

		//if(_i > 0) then {diag_log format["%1 objects disabled", _i];};
		sleep 1800;
        };
};
