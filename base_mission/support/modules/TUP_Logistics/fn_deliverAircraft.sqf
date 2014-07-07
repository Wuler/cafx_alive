#include "\x\cba\addons\main\script_macros_mission.hpp"

// Deliver aircraft

// Aircraft and Helicopters are always delivered to helipads or runways
            
private ["_placeholder","_wp","_v","_grp","_name","_id","_msgObject","_airport","_debug"];

PARAMS_3(_object,_pos,_player);

_debug = debug_mso;

_airport = position _player;

_msgObject = getText(configFile >> 'CfgVehicles' >> _object >> 'displayname');

// Find nearest helipad
if (_object iskindof "Helicopter") then 
{
	_placeholder = "Sign_Pointer_F" createvehicle _pos;
	_airport = position (([["Land_HelipadSquare_F"], [_placeholder], 500, _debug,"ColorBlack","heliport"] call mso_core_fnc_findObjectsByType) call BIS_fnc_selectRandom);
	deletevehicle _placeholder;
};
if (_debug) then {
	diag_log format["MSO-%1 Tup_Logistics: Airport/Helipad: %2", time, _airport];
};

if (!isNil "_airport") then 
{
	_v = [_object,_pos] call logistics_fnc_SpawnVehicle;
	_grp = group _v;
	_wp = _grp addwaypoint [_pos, 0];
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointStatements ["true", "if (vehicle this iskindof ""Plane"") then {vehicle this action [""Land"", vehicle this]};"];
	_wp setWaypointCompletionRadius 1000;
	_wp setWaypointCombatMode "BLUE";
	
	_wp = _grp addwaypoint [_airport, 0];
	_wp setWaypointType "GETOUT";
	_wp setWaypointTimeout [15,30,60];
	_wp setWaypointStatements ["true", "{deletevehicle _x} foreach crew (vehicle this); deletegroup group (vehicle this); {deletevehicle _x; deletegroup group (vehicle _x)} foreach (position (vehicle this)) nearEntities [""CAManBase"", 10];"];
	
	[-1, {PAPABEAR sideChat _this}, format ["%1 this is PAPA BEAR. %2 is on its way to %3 and will land at the nearest helipad or runway.", group _player, _msgObject, _airport]] call CBA_fnc_globalExecute;
	
	//Check to see if killed or landed
	_v addEventHandler ["killed", 
								{
									[-1, {PAPABEAR sideChat _this}, 
										format ["%1 this is PAPA BEAR. We regret to inform you the %2 you ordered has been destroyed.", group (_this select 0), getText(configFile >> 'CfgVehicles' >> typeof (_this select 0) >> 'displayname')]] call CBA_fnc_globalExecute;
								}
							];
	_v addEventHandler ["LandedStopped", 
								{
									[-1, {PAPABEAR sideChat _this}, 
										format ["%1 this is PAPA BEAR. The %2 you ordered has landed at %3", group (_this select 0), getText(configFile >> 'CfgVehicles' >> typeof (_this select 0) >> 'displayname'), position (_this select 0)]] call CBA_fnc_globalExecute; 
										(_this select 0) removeAllEventHandlers "LandedStopped";
								}
							];
	// _v addEventhandler ["GetIn", {[_this,{MSO_R_Air}] execFSM "core\modules\rmm_mp_rights\vehicledrivercheck.fsm"}];
	
} else {
	// Tell group that order cannot be delivered due to no local airport/helipad           
	[-1, {PAPABEAR sideChat _this}, format ["%1 this is PAPA BEAR. %2 delivery aborted as there is no helipad within 500m of delivery location.", group _player, _msgObject]] call CBA_fnc_globalExecute;
};	