private ["_loader","_loadouttype","_truk","_truk_type","_crate","_cargobox","_objectarray"];


_loader = _this select 0;

if (vehicle _loader == player) exitWith{hint "Your not in a Vehicle!";};

//if not (vehicle _loader isKindOf "FFAA_ET_MLV_m2" || vehicle _loader isKindOf "cwr2_Truck5t" || vehicle _loader isKindOf "MTVR") exitwith {hint "Not enough cargo in vehicle!";};

_loadouttype = _this select 3;

_truk = vehicle _loader;

_truk_type = typeof _truk;

// Rifleman Loadout
If (_loadouttype == 1) then
{
    _truk vehicleChat format ["Loading Gear %1... Please Wait...", _truk_type];
    sleep 3;
    
	_cargobox = "B_supplyCrate_F";
    _crate =  createVehicle [_cargobox,[0,0,0],[],0,"CAN_COLLIDE"];
    _crate setVariable ["R3F_LOG_disabled", false];
    
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
    
	_crate addItemCargoGlobal ["ItemRadio",2];
	_crate addItemCargoGlobal ["AGM_Bandage",20];
	_crate addItemCargoGlobal ["AGM_Morphine",10];
	_crate addItemCargoGlobal ["AGM_Epipen",10];
	_crate addItemCargoGlobal ["AGM_Bloodbag",5];
    _crate addItemCargoGlobal ["Rangefinder",1];
    _crate addItemCargoGlobal ["MCC_Console",1];
    _crate addItemCargoGlobal ["ItemcTab",1];
    _crate addItemCargoGlobal ["binocular",1];
    _crate addItemCargoGlobal ["ItemAndroid",4];
    _crate addItemCargoGlobal ["AGM_SpareBarrel",2];
    _crate addItemCargoGlobal ["AGM_UAVBattery",2];
    
    _crate addWeaponCargoGlobal["caf_m72a6",10];
    _crate addWeaponCargoGlobal["caf_ar10t",1];
    
    _crate addMagazineCargoGlobal["30Rnd_556x45_Stanag",24];
    _crate addMagazineCargoGlobal["20Rnd_762x51_Mag",10];
    _crate addMagazineCargoGlobal["200Rnd_556x45_Belt",6];
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
    
	[_truk, [_crate]] call logistics_fnc_addItemsR3F;

    _truk vehicleChat format ["Loading Complete %1..", _truk_type];

    hint "Infantry Gear Loaded";
};

// Weapons Team
If (_loadouttype == 2) then
{
    _truk vehicleChat format ["Loading Gear %1... Please Wait...", _truk_type];
    sleep 3;
    
	_cargobox = "Box_NATO_AmmoVeh_F";
    _crate =  createVehicle [_cargobox,[0,0,0],[],0,"CAN_COLLIDE"];
    _crate setVariable ["R3F_LOG_disabled", false];
    
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
    
	_crate addItemCargoGlobal ["ItemRadio",2];
	_crate addItemCargoGlobal ["AGM_Bandage",10];
	_crate addItemCargoGlobal ["AGM_Morphine",5];
	_crate addItemCargoGlobal ["AGM_Epipen",5];
	_crate addItemCargoGlobal ["AGM_Bloodbag",5];
	_crate addItemCargoGlobal ["Laserbatteries",10];
    _crate addItemCargoGlobal ["Laserdesignator",2];
    _crate addItemCargoGlobal ["Rangefinder",2];
    _crate addItemCargoGlobal ["binocular",2];
    _crate addItemCargoGlobal ["MCC_Console",2];
    _crate addItemCargoGlobal ["ItemAndroid",4];
    _crate addItemCargoGlobal ["AGM_SpareBarrel",4];
    _crate addItemCargoGlobal ["AGM_UAVBattery",4];
    
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

    _crate addMagazineCargoGlobal["100Rnd_127x99_mag_Tracer_Green",20];
    _crate addMagazineCargoGlobal["RDS_6Rnd_TOW_HMMWV",6];
    _crate addMagazineCargoGlobal["RDS_6Rnd_TOW2",6];
    _crate addMagazineCargoGlobal["8Rnd_82mm_Mo_shells",12];
    _crate addMagazineCargoGlobal["8Rnd_82mm_Mo_Flare_white",6];
    _crate addMagazineCargoGlobal["8Rnd_82mm_Mo_Smoke_white",6];
    _crate addMagazineCargoGlobal["FFV502_HEDP",12];
    _crate addMagazineCargoGlobal["FFV551C_HEAT",12];
    _crate addMagazineCargoGlobal["FFV469C_SMOKE",4];
    _crate addMagazineCargoGlobal["FFV545C_ILLUM",4];
    _crate addMagazineCargoGlobal["30Rnd_556x45_Stanag",24];
    _crate addMagazineCargoGlobal["220rnd_762x51_belt",12];
    _crate addMagazineCargoGlobal["HandGrenade",12];
    _crate addMagazineCargoGlobal["smokeshell",12];
    _crate addMagazineCargoGlobal["smokeshellgreen",6];
    _crate addMagazineCargoGlobal["smokeshellred",12];
    _crate addMagazineCargoGlobal["smokeshellblue",6];
	_crate addMagazineCargoGlobal["1Rnd_HE_Grenade_shell",24];
	_crate addMagazineCargoGlobal["1Rnd_Smoke_Grenade_shell",24];
	_crate addmagazinecargoGlobal["1Rnd_SmokeRed_Grenade_shell",12];
	_crate addmagazinecargoGlobal["1Rnd_SmokeGreen_Grenade_shell",12];
	_crate addmagazinecargoGlobal["1Rnd_Smokeyellow_Grenade_shell",6];
	_crate addmagazinecargoGlobal["1Rnd_SmokePurple_Grenade_shell",6];
	_crate addmagazinecargoGlobal["1Rnd_SmokeBlue_Grenade_shell",6];
	_crate addmagazinecargoGlobal["1Rnd_SmokeOrange_Grenade_shell",6];
    _crate addMagazineCargoGlobal["UGL_FlareWhite_F",6];
    
	[_truk, [_crate]] call logistics_fnc_addItemsR3F;
    
    _truk vehicleChat format ["Loading Complete %1..", _truk_type];

    hint "Weapons Det Gear Loaded";
};

// Medical Team
If (_loadouttype == 3) then
{
    _truk vehicleChat format ["Loading Gear %1... Please Wait...", _truk_type];
    sleep 3;

	_cargobox = "x39_medicBox";
    _crate =  createVehicle [_cargobox,[0,0,0],[],0,"CAN_COLLIDE"];
    _crate setVariable ["R3F_LOG_disabled", false];
    
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
    
	_crate addItemCargoGlobal ["ItemRadio",2];
	_crate addItemCargoGlobal ["AGM_Bandage",50];
	_crate addItemCargoGlobal ["AGM_Morphine",20];
	_crate addItemCargoGlobal ["AGM_Epipen",20];
	_crate addItemCargoGlobal ["AGM_Bloodbag",20];
    _crate addItemCargoGlobal ["Rangefinder",1];
    _crate addItemCargoGlobal ["binocular",1];
    _crate addItemCargoGlobal ["MCC_Console",1];
    _crate addItemCargoGlobal ["ItemcTab",1];
    _crate addItemCargoGlobal ["ItemAndroid",4];
    
    _crate addMagazineCargoGlobal["30Rnd_556x45_Stanag",12];
    _crate addMagazineCargoGlobal["HandGrenade",12];
    _crate addMagazineCargoGlobal["smokeshell",12];
    _crate addMagazineCargoGlobal["smokeshellblue",12];
    _crate addMagazineCargoGlobal["UGL_FlareWhite_F",6];
    
	[_truk, [_crate]] call logistics_fnc_addItemsR3F;
    _truk vehicleChat format ["Loading Complete %1..", _truk_type];

    hint "Medical Gear Loaded";
};

_truk removeaction truckzid1;
_truk removeaction truckzid2;
_truk removeaction truckzid3;
