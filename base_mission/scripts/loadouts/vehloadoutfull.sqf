if(!isserver) exitwith {};

#include "geardefinitions.hpp"

private ["_cargobox","_crate"];

	_cargobox = "B_supplyCrate_F";
    	_crate = createVehicle [_cargobox,[0,0,0],[],0,"CAN_COLLIDE"];

	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;

	_crate addItemCargoGlobal ["ItemRadio",2];
	_crate addItemCargoGlobal ["Rangefinder",1];
	_crate addItemCargoGlobal [_bino,1];
	_crate addItemCargoGlobal [_toolkit,1];
	
	_crate addWeaponCargoGlobal["caf_m72a6",10];
	_crate addWeaponCargoGlobal["RH_mk12mod1",1];

	//cse meds
	_crate addMagazineCargoGlobal ["cse_bandage_basic",20];
	_crate addMagazineCargoGlobal ["cse_tourniquet",5];
	_crate addMagazineCargoGlobal["cse_weather_meter",1];
    	_crate addMagazineCargoGlobal["30Rnd_556x45_Stanag",30];
	_crate addMagazineCargoGlobal["200Rnd_556x45_Box",6];
	_crate addMagazineCargoGlobal["HandGrenade",24];
	_crate addMagazineCargoGlobal["smokeshell",24];
	_crate addMagazineCargoGlobal["smokeshellgreen",6];
	_crate addMagazineCargoGlobal["smokeshellred",6];
	_crate addMagazineCargoGlobal["smokeshellblue",6];
	_crate addMagazineCargoGlobal["1Rnd_HE_Grenade_shell",24];
	_crate addMagazineCargoGlobal["1Rnd_Smoke_Grenade_shell",24];
	_crate addmagazinecargoGlobal["1Rnd_SmokeGreen_Grenade_shell",12];
	_crate addmagazinecargoGlobal["1Rnd_Smokeyellow_Grenade_shell",6];
	_crate addmagazinecargoGlobal["1Rnd_SmokePurple_Grenade_shell",6];
	_crate addmagazinecargoGlobal["1Rnd_SmokeBlue_Grenade_shell",6];
	_crate addmagazinecargoGlobal["1Rnd_SmokeOrange_Grenade_shell",6];
    	_crate addMagazineCargoGlobal["UGL_FlareWhite_F",6];

	[_crate, _this select 0] call cse_fnc_loadObject_LOG;
