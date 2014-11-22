if(!isserver) exitwith {};

#include "geardefinitions.hpp"

private ["_crate"];

	clearWeaponCargoGlobal (_this select 0);
	clearMagazineCargoGlobal (_this select 0);
	clearItemCargoGlobal (_this select 0);
	clearBackpackCargoGlobal (_this select 0);

	//cse meds
		(_this select 0) addMagazineCargoGlobal [_bandage,30];
		(_this select 0) addMagazineCargoGlobal [_packing,20];
		(_this select 0) addMagazineCargoGlobal [_morphine,20];
		(_this select 0) addMagazineCargoGlobal [_epi,20];
		(_this select 0) addMagazineCargoGlobal [_atropine,20];
		(_this select 0) addMagazineCargoGlobal [_splint,10];
		(_this select 0) addMagazineCargoGlobal [_tourniquet,10];
		(_this select 0) addMagazineCargoGlobal [_plasma,10];
		(_this select 0) addMagazineCargoGlobal [_bloodbag,10];
		(_this select 0) addMagazineCargoGlobal [_saline,10];
		(_this select 0) addMagazineCargoGlobal [_quikclot,10];
		(_this select 0) addMagazineCargoGlobal [_npa,10];
		(_this select 0) addMagazineCargoGlobal [_opa,10];
		(_this select 0) addMagazineCargoGlobal [_elastic,10];
		(_this select 0) addMagazineCargoGlobal [_liquidSkin,10];
		(_this select 0) addMagazineCargoGlobal [_chestseal,10];
		(_this select 0) addMagazineCargoGlobal [_medkit,20];

    (_this select 0) addMagazineCargoGlobal[_rifle_mag,12];
    (_this select 0) addMagazineCargoGlobal[_grenade,12];
    (_this select 0) addMagazineCargoGlobal[_smoke,12];
    (_this select 0) addMagazineCargoGlobal[_smoke_blue,12];

    _crate =  createVehicle ["cse_medical_supply_crate_cms",[0,0,0],[],0,"CAN_COLLIDE"];

	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;

	//cse meds
		_crate addMagazineCargoGlobal [_bandage,20];
		_crate addMagazineCargoGlobal [_packing,20];
		_crate addMagazineCargoGlobal [_epi,10];
		_crate addMagazineCargoGlobal [_atropine,10];
		_crate addMagazineCargoGlobal [_morphine,20];
		_crate addMagazineCargoGlobal [_splint,10];
		_crate addMagazineCargoGlobal [_tourniquet,10];
		_crate addMagazineCargoGlobal [_plasma,10];
		_crate addMagazineCargoGlobal [_bloodbag,10];
		_crate addMagazineCargoGlobal [_saline,10];
		_crate addMagazineCargoGlobal [_quikclot,10];
		_crate addMagazineCargoGlobal [_npa,10];
		_crate addMagazineCargoGlobal [_opa,10];
		_crate addMagazineCargoGlobal [_elastic,10];
		_crate addMagazineCargoGlobal [_liquidSkin,10];
		_crate addMagazineCargoGlobal [_chestseal,10];
		_crate addMagazineCargoGlobal [_medkit,20];

	[_crate, _this select 0] call cse_fnc_loadObject_LOG;