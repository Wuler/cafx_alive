private ["_loader","_loadout","_truk","_truk_type","_crate","_cargobox","_objectarray"];

_loader = player;

_loadout = _this;

_truk = vehicle _loader;

// Rifleman Loadout
If (_loadout == 1) exitwith
{
    _truk vehicleChat format ["Loading Gear %1... Please Wait...", _truk_type];
    sleep 3;

	_cargobox = "B_supplyCrate_F";
    _crate =  createVehicle [_cargobox,[0,0,0],[],0,"CAN_COLLIDE"];

	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;

	_crate addItemCargoGlobal ["ItemRadio",2];
    _crate addItemCargoGlobal ["Rangefinder",1];
    _crate addItemCargoGlobal ["binocular",1];

    _crate addWeaponCargoGlobal["caf_m72a6",10];
    _crate addWeaponCargoGlobal["RH_mk12mod1",1];

    _crate addMagazineCargoGlobal ["cse_bandage_basic",20];
    _crate addMagazineCargoGlobal ["cse_tourniquet",5];

    _crate addMagazineCargoGlobal["cse_weather_meter",1];
    _crate addMagazineCargoGlobal["30Rnd_556x45_Stanag",24];
    _crate addMagazineCargoGlobal["20Rnd_762x51_Mag",10];
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

	[_crate, _truk] call cse_fnc_loadObject_LOG;

    _truk vehicleChat format ["Loading Complete %1..", _truk_type];

    hint "Infantry Gear Loaded";
};

// Weapons Team
If (_loadout == 2) exitwith
{
    _truk vehicleChat format ["Loading Gear %1... Please Wait...", _truk_type];
    sleep 3;

	_cargobox = "Box_NATO_AmmoVeh_F";
    _crate =  createVehicle [_cargobox,[0,0,0],[],0,"CAN_COLLIDE"];

	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;

	_crate addItemCargoGlobal ["ItemRadio",2];
	_crate addItemCargoGlobal ["Laserbatteries",2];
    _crate addItemCargoGlobal ["Laserdesignator",1];
    _crate addItemCargoGlobal ["Rangefinder",2];
    _crate addItemCargoGlobal ["binocular",2];

    _crate addBackpackCargoGlobal["RDS_M252_Gun_Bag",2];
    _crate addBackpackCargoGlobal["RDS_M252_Bipod_Bag",2];
    _crate addBackpackCargoGlobal["RDS_Mk19_Gun_Bag",1];
    _crate addBackpackCargoGlobal["RDS_Mk19_Tripod_Bag",1];
    _crate addBackpackCargoGlobal["RDS_M2_Gun_Bag",2];
    _crate addBackpackCargoGlobal["RDS_M2_Tripod_Bag",1];
    _crate addBackpackCargoGlobal["RDS_M2_MiniTripod_Bag",1];
    _crate addBackpackCargoGlobal["RDS_Tow_Gun_Bag",1];
    _crate addBackpackCargoGlobal["RDS_TOW_Tripod_Bag",1];

    _crate addWeaponCargoGlobal["caf_m72a6",5];
    _crate addWeaponCargoGlobal["CAF_M2CG",2];
    _crate addWeaponCargoGlobal["caf_c6gpmg",2];

	//cse meds
	_crate addMagazineCargoGlobal ["cse_bandage_basic",20];
	_crate addMagazineCargoGlobal ["cse_tourniquet",5];

    _crate addMagazineCargoGlobal["cse_weather_meter",1];
    _crate addMagazineCargoGlobal["100Rnd_127x99_mag_Tracer_Green",20];
    _crate addMagazineCargoGlobal["RDS_6Rnd_TOW_HMMWV",6];
    _crate addMagazineCargoGlobal["RDS_6Rnd_TOW2",6];
    _crate addMagazineCargoGlobal["8Rnd_82mm_Mo_shells",12];
    _crate addMagazineCargoGlobal["8Rnd_82mm_Mo_Flare_white",6];
    _crate addMagazineCargoGlobal["8Rnd_82mm_Mo_Smoke_white",6];
    _crate addMagazineCargoGlobal["FFV551_HEAT",12];
    _crate addMagazineCargoGlobal["FFV441_HEDP",12];
    _crate addMagazineCargoGlobal["30Rnd_556x45_Stanag",24];
    _crate addMagazineCargoGlobal["220rnd_762x51_belt",12];
    _crate addMagazineCargoGlobal["ATMine_Range_Mag",12];
    _crate addMagazineCargoGlobal["APERSMine_Range_Mag",12];
    _crate addMagazineCargoGlobal["APERSBoundingMine_Range_Mag",12];
    _crate addMagazineCargoGlobal["SLAMDirectionalMine_Wire_Mag",12];
    _crate addMagazineCargoGlobal["APERSTripMine_Wire_Mag",12];
    _crate addMagazineCargoGlobal["ClaymoreDirectionalMine_Remote_Mag",12];
    _crate addMagazineCargoGlobal["DemoCharge_Remote_Mag",12];
    _crate addMagazineCargoGlobal["SatchelCharge_Remote_Mag",12];

	[_crate, _truk] call cse_fnc_loadObject_LOG;

    _truk vehicleChat format ["Loading Complete %1..", _truk_type];

    hint "Heavy Weapons Loaded";
};

// Medical Team
If (_loadout == 3) exitwith
{
    _truk vehicleChat format ["Loading Gear %1... Please Wait...", _truk_type];
    sleep 3;

	_cargobox = "cse_medical_supply_crate_cms";
    _crate =  createVehicle [_cargobox,[0,0,0],[],0,"CAN_COLLIDE"];

	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;

	_crate addItemCargoGlobal ["ItemRadio",2];
    _crate addItemCargoGlobal ["Rangefinder",1];
    _crate addItemCargoGlobal ["binocular",1];

	//cse meds
		_crate addMagazineCargoGlobal ["cse_bandage_basic",20];
		_crate addMagazineCargoGlobal ["cse_packing_bandage",20];
		_crate addMagazineCargoGlobal ["cse_morphine",20];
		_crate addMagazineCargoGlobal ["cse_epinephrine",20];
		_crate addMagazineCargoGlobal ["cse_morphine",20];
		_crate addMagazineCargoGlobal ["cse_splint",10];
		_crate addMagazineCargoGlobal ["cse_tourniquet",10];
		_crate addMagazineCargoGlobal ["cse_plasma_iv",10];
		_crate addMagazineCargoGlobal ["cse_blood_iv",10];
		_crate addMagazineCargoGlobal ["cse_saline_iv",10];
		_crate addMagazineCargoGlobal ["cse_quikclot",10];
		_crate addMagazineCargoGlobal ["cse_nasopharyngeal_tube",10];
		_crate addMagazineCargoGlobal ["cse_opa",10];
		_crate addMagazineCargoGlobal ["cse_bandageElastic",10];
		_crate addMagazineCargoGlobal ["cse_liquidSkin",10];
		_crate addMagazineCargoGlobal ["cse_chestseal",10];
		_crate addMagazineCargoGlobal ["cse_personal_aid_kit",20];

    _crate addMagazineCargoGlobal["30Rnd_556x45_Stanag",12];
    _crate addMagazineCargoGlobal["HandGrenade",12];
    _crate addMagazineCargoGlobal["smokeshell",12];
    _crate addMagazineCargoGlobal["smokeshellblue",12];
    _crate addMagazineCargoGlobal["UGL_FlareWhite_F",6];

	[_crate, _truk] call cse_fnc_loadObject_LOG;

    _truk vehicleChat format ["Loading Complete %1..", _truk_type];

    hint "Medical Gear Loaded";
};
