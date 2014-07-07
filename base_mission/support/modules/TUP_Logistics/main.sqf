if !(isserver && isDedicated) then	{
	"TUP_LOGISTICS_REQUEST" addPublicVariableEventHandler { 
			if (debug_mso) then {
				diag_log format["MSO-%1 Tup_Logistics: Receiving %2 position %3", time, (_this select 1) select 1, (_this select 1) select 0];
			};
			(_this select 1) call logistics_fnc_delivery;
	};
};

debug_mso = false;

#include <logistics.hpp>

//if (isNil "tup_logistics_defence") then {
	tup_logistics_defence = [
		"Land_Mil_WallBig_Corner_F",
		"Land_Mil_WallBig_4m_F",
		"Land_HBarrierBig_F",
		"Land_HBarrier_1_F",
		"Land_HBarrier_3_F",
		"Land_HBarrier_5_F",
        "Land_Concrete_SmallWall_4m_F",
        "Land_Concrete_SmallWall_8m_F",
	    "Land_BagFence_Corner_F",
	    "Land_BagFence_End_F",
	    "Land_BagFence_Long_F",
	    "Land_BagBunker_Small_F",
	    "Land_BagFence_Short_F",
	    "Land_BagFence_Round_F",
        "Land_Cargo20_military_green_F",
        "Land_Cargo40_military_green_F",
        "CamoNet_BLUFOR_F",
        "CamoNet_BLUFOR_open_F",
        "CamoNet_BLUFOR_big_F"
        ];
//};


tup_logistics_container = ["Land_CargoBox_V1_F"];

if (isDedicated) exitwith {};

//if (!(getPlayerUID player) in MSO_R_Leader)) exitwith {};

// Set lines of data
TUP_logistics_lines = [
	{["0","1","2"]},
	{["0","1","2","3","4"]},
	{["0","1","2","3","4","5","6","7","8","9"]},
	{["0","1","2","3","4","5","6","7","8","9"]},
	{["0","1","2","3","4","5","6","7","8","9"]}
];

TUP_logistics_delivery = [
	"Para Drop (any weight)",
	"Airlift",
	"Road Convoy",
	"GPS Guided Para Drop"
];

if (isNil "tup_logistics_frequency") then {
	tup_logistics_frequency = 12;
};

if (isNil "tup_logistics_orderlimit") then {
	tup_logistics_orderlimit = 5000000;
};

tup_logistics_curorderlimit = tup_logistics_orderlimit;
//tup_logistics_nextorder = date;

// Define logistics - defaults if not set in logistics.hpp
if (isNil "tup_logistics_air") then {
	tup_logistics_air = [0, faction player,"Air"] call mso_core_fnc_findVehicleType;
	//diag_log format["Air = %1",tup_logistics_air];
};

if (isNil "tup_logistics_land") then {
	tup_logistics_land = [0, faction player,"Car"] call mso_core_fnc_findVehicleType; 
	//diag_log format["Car = %1",tup_logistics_land];
	tup_logistics_land = tup_logistics_land + ([0, faction player,"Tank"] call mso_core_fnc_findVehicleType);
	//diag_log format["Car + Tank = %1",tup_logistics_land];
	tup_logistics_land = tup_logistics_land + ([0, faction player,"Motorcycle"] call mso_core_fnc_findVehicleType); 
	//diag_log format["Car + Tank + Bikes = %1",tup_logistics_land];
};

if (isNil "tup_logistics_crate") then {
	tup_logistics_crate = ["Default","ReammoBox"] call logistics_fnc_findNonVehicleType;
	tup_logistics_crate = tup_logistics_crate + ["Barrels"]; // Adding fuel barrels to resupply
	//diag_log format["Crate = %1",tup_logistics_crate];
};

if (isNil "tup_logistics_static") then {
	tup_logistics_static = [faction player,"StaticWeapon"] call logistics_fnc_findNonVehicleType;
	//diag_log format["Static = %1",tup_logistics_static];
};

//["player",[221,[false,false,false]],-9900,["support\modules\TUP_Logistics\fn_menudef.sqf","main"]] call ALIVE_fnc_flexiMenu_Add;