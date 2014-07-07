clearWeaponCargoGlobal _this;
clearMagazineCargoGlobal _this;
clearItemCargoGlobal _this;

// INFANTRY
_this addaction [">> Rifleman AR", "scripts\cafloadout.sqf", "RFM", 0, true, true, "", ""];
_this addaction [">> Rifleman TW", "scripts\cafloadout.sqf", "RFM_TW", 0, true, true, "", ""];
_this addaction [">> Grenadier AR", "scripts\cafloadout.sqf", "GREN", 0, true, true, "", ""];
_this addaction [">> Grenadier TW", "scripts\cafloadout.sqf", "GREN_TW", 0, true, true, "", ""];
_this addaction [">> AT AR", "scripts\cafloadout.sqf", "AT", 0, true, true, "", ""];
_this addaction [">> AT TW", "scripts\cafloadout.sqf", "AT_TW", 0, true, true, "", ""];

_this addaction [">> C9 AR", "scripts\cafloadout.sqf", "C9", 0, true, true, "", ""];
_this addaction [">> C9 TW", "scripts\cafloadout.sqf", "C9_TW", 0, true, true, "", ""];
_this addaction [">> C6 AR", "scripts\cafloadout.sqf", "C6", 0, true, true, "", ""];
_this addaction [">> C6 TW", "scripts\cafloadout.sqf", "C6_TW", 0, true, true, "", ""];

_this addaction [">> IC AR", "scripts\cafloadout.sqf", "IC", 0, true, true, "", ""];
_this addaction [">> IC TW", "scripts\cafloadout.sqf", "IC_TW", 0, true, true, "", ""];

// SPECIALTY
_this addaction [">> TCCC AR", "scripts\cafloadout.sqf", "TCCC", 0, true, true, "", ""];
_this addaction [">> TCCC TW", "scripts\cafloadout.sqf", "TCCC_TW", 0, true, true, "", ""];
_this addaction [">> Engineer AR", "scripts\cafloadout.sqf", "ENGI", 0, true, true, "", ""];
_this addaction [">> Engineer TW", "scripts\cafloadout.sqf", "ENGI_TW", 0, true, true, "", ""];

// ARMORED
_this addaction [">> Crewman AR", "scripts\cafloadout.sqf", "CREW", 0, true, true, "", ""];
_this addaction [">> Crewman TW", "scripts\cafloadout.sqf", "CREW_TW", 0, true, true, "", ""];

// AIRDET
_this addaction [">> Helo Pilot", "scripts\cafloadout.sqf", "PILOT_HELO", 0, true, true, "", ""];

/////CAF weapons and SF_weapons

_this addweaponCargo ["caf_C8A3",20];
_this addweaponCargo ["caf_C7A2",20];
_this addweaponCargo ["caf_C7A2_M203",10];
_this addweaponCargo ["caf_C8A3_M203",10];
_this addweaponCargo ["caf_c6gpmg",10];
_this addweaponCargo ["caf_c9a2",10];
_this addweaponcargo ["caf_m72a6",20];
_this addmagazinecargo ["30Rnd_556x45_T_stanag",100];
_this addmagazinecargo ["30Rnd_556x45_Stanag",100];
_this addmagazinecargo ["220Rnd_762x51_belt",100];
_this addmagazineCargo ["200Rnd_556x45_Belt",100];
_this addmagazinecargo ["20Rnd_762x51_Mag",100];
_this addmagazinecargo ["1Rnd_HE_Grenade_shell",100];
_this addmagazinecargo ["UGL_FlareWhite_F"];
_this addmagazinecargo ["UGL_FlareGreen_F"];
_this addmagazinecargo ["UGL_FlareRed_F"];
_this addmagazinecargo ["UGL_FlareYellow_F",100];
_this addmagazinecargo ["UGL_FlareCIR_F",100];
_this addmagazinecargo ["1Rnd_Smoke_Grenade_shell",100];
_this addmagazinecargo ["1Rnd_SmokeRed_Grenade_shell",100];
_this addmagazinecargo ["1Rnd_SmokeGreen_Grenade_shell",100];
_this addmagazinecargo ["1Rnd_Smokeyellow_Grenade_shell",100];
_this addmagazinecargo ["1Rnd_SmokePurple_Grenade_shell",100];
_this addmagazinecargo ["1Rnd_SmokeBlue_Grenade_shell",100];
_this addmagazinecargo ["1Rnd_SmokeOrange_Grenade_shell",100];


/////// items for CAF

_this additemcargo ["laserdesignator",5];
_this additemcargo ["laserbatt",10];
_this additemcargo ["optic_Arco",10];
_this additemcargo ["optic_Hamr",10];
_this additemcargo ["optic_ACO",10];
_this additemcargo ["optic_ACO_grn",10];
_this additemcargo ["optic_Holosight",10];
_this additemcargo ["optic_SOS",10];
_this additemcargo ["acc_flashlight",10];
_this additemcargo ["acc_pointer_IR",10];
_this additemcargo ["optic_carryhandle",30];
_this additemcargo ["optic_elcan",30];
_this additemcargo ["RH_peq2",30];
_this additemcargo ["RH_peq15",30];
_this additemcargo ["RH_compM4s",30];
_this additemcargo ["RH_eotech553",30];
_this additemcargo ["ItemcTab",30];
_this additemcargo ["ItemAndroid",30];
_this additemcargo ["ItemcTabHCam",30];
_this additemcargo ["MCC_Console",30];
_this additemcargo ["AGM_Bandage",60];
_this additemcargo ["AGM_Morphine",20];
_this additemcargo ["AGM_Epipen",20];
_this additemcargo ["AGM_Bloodbag",20];