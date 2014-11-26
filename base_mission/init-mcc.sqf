mccPresetsObjects = [
					 ['Pickable Object','_this call MCC_fnc_pickItem;']
					,['Disable Simulation','_this enableSimulation false;']
					,['Destroy Object', '_this setdamage 1;']
					,['Flip Object', '[_this ,0, 90] call bis_fnc_setpitchbank;']
					,['Virtual Ammobox System (VAS)', '_this addAction ["<t color=""#ff1111"">Virtual Ammobox </t>", "'+MCC_path+'VAS\open.sqf"];']
					,['Virtual Arsenal (BIS)', 'if (isServer) then {["AmmoboxInit",[_this,true]] call BIS_fnc_arsenal};']
					,['Loadouts (7CMBG)', '_this execvm "scripts\ammo.sqf"; _this execvm "scripts\arsenal.sqf";']
					,['Medical Facility (CMS)', '_this setvariable ["cse_medical_facility", true, true];']
					,['Medical Vehicle (CMS)', '_this setvariable ["cse_medical_vehicle", true, true];']
					,['Vehicle loadout', '_this execvm "scripts\loadoutfull.sqf";']
					,['Satellite Comms','_this addAction ["SatCOM", {call compile preprocessfilelinenumbers "support\modules\pxs_satcom_oa\start_satellite.sqf"}];']
					,['Defuse Bomb 90s - change code and timer','CODE = [1,2,3,4,5,6]; [_this, 90] spawn COB_fnc_bombTimer; _this allowdamage false; _this addAction ["DEFUSE","scripts\DEFUSE\defuseAction.sqf","",1,true,true,"","(_target distance _this) < 3"];']
					,['Contains bomb code - change The Code','_this addAction [("<t color=""#E61616"">" + ("The Code") + "</t>"),"scripts\DEFUSE\searchAction.sqf","",1,true,true,"","(_target distance _this) < 3";']
					,['Destroyable by satchels only', '_this addEventHandler ["handledamage", {if ((_this select 4) in ["SatchelCharge_Remote_Ammo","DemoCharge_Remote_Ammo"]) then {(_this select 0) setdamage 1;(_this select 3) addRating 1500} else {0}}];']
					,['', '']
					,['======= Effects =======','']
					,['Sandstorm','[_this] call BIS_fnc_sandstorm;']
					,['Flies','[getposatl _this] call BIS_fnc_flies;']
					,['Smoke','if (isServer) then {_effect = "test_EmptyObjectForSmoke" createVehicle (getpos _this);_effect setpos (getpos _this)};']
					,['Fire','if (isServer) then {_effect = "test_EmptyObjectForFireBig" createVehicle (getpos _this);_effect setpos (getpos _this)};']
					,['', '']
					,['======= Misc =======','']
					,['Create Local Marker', '_this execVM "'+MCC_path+'mcc\general_scripts\create_local_marker.sqf";']
					];

Ares_EditableObjectBlacklist = Ares_EditableObjectBlacklist + [
	"ALiVE_sys_GC",
	"ALiVE_sys_adminactions",
	"ALiVE_SYS_spotrep",
	"ALiVE_sys_newsfeed",
	"ALiVE_SYS_marker",
	"ALiVE_SYS_LOGISTICS",
	"ALiVE_SYS_sitrep",
	"ALiVE_SYS_patrolrep",
	"SideOPFOR_F",
	"SideResistance_F",
	"SideBLUFOR_F",
	"ALiVE_mil_placement",
	"ALiVE_mil_OPCOM",
	"ALiVE_mil_logistics",
	"ALiVE_civ_placement",
	"cse_sys_weaponrest",
	"cse_damage_ai",
	"cse_sys_gestures",
	"ALiVE_SYS_LOGISTICSDISABLE",
	"ALiVE_sys_profile",
	"cse_sys_winddeflection",
	"cse_sys_medical",
	"ALiVE_MIL_C2ISTAR",
	"ALiVE_SUP_PLAYER_RESUPPLY",
	"cse_sys_attachableItems",
	"cse_sys_logistics",
	"ALiVE_amb_civ_placement",
	"ALiVE_amb_civ_population",
	"cse_sys_magazineRepack",
	"cse_sys_advanced_interaction",
	"ALiVE_mil_cqb",
	"cse_sys_groups",
	"cse_sys_backblast",
	"mcc_sandbox_moduleGAIASettings",
	"ALiVE_require",
	"cse_sys_tags",
	"cse_sys_nightvision",
	"mcc_sandbox_moduleMissionSettings",
	"mcc_sandbox_moduleCover",
	"Logic",
	"ModuleCurator_F",
	"FxWindGrass1",
	"FxWindPollen1",
	"FxWindLeaf3"
];

//ARES hack
if (isnil "seven_objectsgrabber") then {seven_objectsgrabber = compile preprocessFileLineNumbers "functions\fn_objectsgrabber.sqf"};

if (isserver) then {
	private ["_mishvar","_misharray","_createdUnits"];
	_mishvar = profileNamespace getvariable format ["ares_%1",worldname];
	_misharray = call compile _mishvar;
	_createdUnits = [objNull, _misharray] call Ares_fnc_ObjectsMapper;
	[_createdUnits] call Ares_fnc_AddUnitsToCurator;
};