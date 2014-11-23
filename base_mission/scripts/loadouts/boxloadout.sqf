#include "geardefinitions.hpp"

// drop all gear
removeAllItems player;
removeAllWeapons player;
removeAllContainers player;
removeUniform player;
removeVest player;
removeHeadgear player;
removeAllAssignedItems player;
removeGoggles player;

// select loadout
switch toupper(_this select 3) do {
	case "RFM": {
		player adduniform _uniform_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_ar;
		player addgoggles _goggles;

		player addweapon _rifle;
		player addweapon _lat;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		player addmagazine _rifle_mag_tr;
		player addmagazine _lmg_mag;
		{player addmagazine _grenade} foreach [1,2,3];
		{player addmagazine _smoke} foreach [1,2];
		player addmagazine _smoke_green;
	};
	case "RFM_TW": {
		player adduniform _uniform_tw;
		player addheadgear _helmet_tw;
		player addvest _vest_tw;
		player addgoggles _goggles;

		player addweapon _rifle;
		player addweapon _lat;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		player addmagazine _rifle_mag_tr;
		player addmagazine _lmg_mag;
		{player addmagazine _grenade} foreach [1,2,3];
		{player addmagazine _smoke} foreach [1,2];
		player addmagazine _smoke_green;
	};
	case "GREN": {
		player adduniform _uniform_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_ar;
		player addgoggles _goggles;

		player addweapon _rifle_gl;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5];
		//player addmagazine _rifle_mag_tr;
		player addmagazine _lmg_mag;
		{player addmagazine _grenade} foreach [1];
		{player addmagazine _smoke} foreach [1];
		{player addmagazine _gl_he} foreach [1,2,3,4,5,6,7,8];
		{player addmagazine _gl_smoke} foreach [1,2,3,4];
		player addmagazine _gl_smoke_red;
		player addmagazine _gl_smoke_green;
	};
	case "GREN_TW": {
		player adduniform _uniform_tw;
		player addheadgear _helmet_tw;
		player addvest _vest_tw;
		player addgoggles _goggles;

		player addweapon _rifle_gl;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		player addmagazine _rifle_mag_tr;
		player addmagazine _lmg_mag;
		{player addmagazine _grenade} foreach [1,2];
		{player addmagazine _smoke} foreach [1,2];
		{player addmagazine _gl_he} foreach [1,2,3,4,5,6,7,8];
		{player addmagazine _gl_smoke} foreach [1,2,3,4];
		player addmagazine _gl_smoke_red;
		player addmagazine _gl_smoke_green;
	};
	case "C9": {
		player adduniform _uniform_long_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_gl_ar;
		Player addgoggles _goggles;
		//{player addItem _sparebarrel} foreach [1,2];

		player addweapon _lmg;

		{player addmagazine _lmg_mag} foreach [1,2,3];
		{player addmagazine _grenade} foreach [1,2];
		{player addmagazine _smoke} foreach [1,2];
	};
	case "C9_TW": {
		player adduniform _uniform_long_tw;
		player addheadgear _helmet_tw;
		player addvest _vest_gl_tw;
		Player addgoggles _goggles;
		//{player addItem _sparebarrel} foreach [1,2];

		player addweapon _lmg;

		{player addmagazine _lmg_mag} foreach [1,2,3];
		{player addmagazine _grenade} foreach [1,2];
		{player addmagazine _smoke} foreach [1,2];
	};
	case "C6": {
		player adduniform _uniform_long_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_gl_ar;
		player addgoggles _goggles;

		player addweapon _mmg;
		player addweapon _pistol;

		{player addmagazine _mmg_mag} foreach [1,2];
		{player addmagazine _pistol_mag} foreach [1,2];
		player addmagazine _smoke;
	};
	case "C6_TW": {
		player adduniform _uniform_long_tw;
		player addheadgear _helmet_tw;
		player addvest _vest_gl_tw;
		player addgoggles _goggles;
		//{player addItem _sparebarrel} foreach [1,2];

		player addweapon _mmg;
		player addweapon _pistol;

		{player addmagazine _mmg_mag} foreach [1,2];
		{player addmagazine _pistol_mag} foreach [1,2];
		player addmagazine _smoke;
	};
	case "C6A": {
		player adduniform _uniform_long_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_ar;
		player addgoggles _goggles;
		player addweapon _rangefinder;
		//{player addItem _sparebarrel} foreach [1,2];

		player addweapon _carbine;

		{player addmagazine _carbine_mag} foreach [1,2,3,4,5,6];
		player addmagazine _carbine_mag_tr;
		{player addmagazine _mmg_mag} foreach [1,2];
		player addmagazine _smoke;
	};
	case "C6A_TW": {
		player adduniform _uniform_long_tw;
		player addheadgear _helmet_tw;
		player addvest _vest_gl_tw;
		player addgoggles _goggles;
		player addweapon _rangefinder;
		{player addItem _sparebarrel} foreach [1,2];

		player addweapon _carbine;

		{player addmagazine _carbine_mag} foreach [1,2,3,4,5,6];
		player addmagazine _carbine_mag_tr;
		{player addmagazine _mmg_mag} foreach [1,2];
		player addmagazine _smoke;
	};
	case "AT": {
		player adduniform _uniform_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_ar;
		player addgoggles _goggles;

		player addweapon _carbine;
		player addweapon _mat;

		{player addmagazine _carbine_mag} foreach [1,2,3,4,5,6];
		player addmagazine _carbine_mag_tr;
		player addmagazine _smoke;

        	player addBackpack _bp_large;
		clearMagazineCargoGlobal (unitBackpack player);
        	clearItemCargoGlobal (unitBackpack player);
		(unitBackpack player) addMagazineCargoGlobal [_mat_heat, 2];
		(unitBackpack player) addMagazineCargoGlobal [_mat_hedp, 2];
	};
	case "AT_TW": {
		player adduniform _uniform_tw;
		player addheadgear _helmet_tw;
		player addvest _vest_tw;
		player addgoggles _goggles;
		player linkItem _android;

		player addweapon _carbine;
		player addweapon _mat;

		{player addmagazine _carbine_mag} foreach [1,2,3,4,5,6];
		player addmagazine _carbine_mag_tr;
		player addmagazine _smoke;

        	player addBackpack _bp_large_tw;
		clearMagazineCargoGlobal (unitBackpack player);
        	clearItemCargoGlobal (unitBackpack player);
		(unitBackpack player) addMagazineCargoGlobal [_mat_heat, 2];
		(unitBackpack player) addMagazineCargoGlobal [_mat_hedp, 2];
	};
	case "ATA": {
		player adduniform _uniform_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_ar;
		player addweapon _rangefinder;
		player addgoggles _goggles;

		player addweapon _rifle;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		player addmagazine _rifle_mag_tr;
		player addmagazine _smoke;

        	player addBackpack _bp_large;
		clearMagazineCargoGlobal (unitBackpack player);
        	clearItemCargoGlobal (unitBackpack player);
		(unitBackpack player) addMagazineCargoGlobal [_mat_heat, 2];
		(unitBackpack player) addMagazineCargoGlobal [_mat_hedp, 2];
	};
	case "ATA_TW": {
		player adduniform _uniform_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_ar;
		player addweapon _rangefinder;
		player addgoggles _goggles;

		player addweapon _rifle;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		player addmagazine _rifle_mag_tr;
		player addmagazine _smoke;

        	player addBackpack _bp_large_tw;
		clearMagazineCargoGlobal (unitBackpack player);
        	clearItemCargoGlobal (unitBackpack player);
		(unitBackpack player) addMagazineCargoGlobal [_mat_heat, 2];
		(unitBackpack player) addMagazineCargoGlobal [_mat_hedp, 2];
	};
	case "ENGI": {
		player adduniform _uniform_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_ar;
		Player addgoggles _goggles;
		player addweapon _bino;

		player addweapon _carbine;

		{player addmagazine _carbine_mag} foreach [1,2,3,4,5,6];
		player addmagazine _carbine_mag_tr;
		{player addmagazine _smoke} foreach [1,2];
		{player addmagazine _smoke_green} foreach [1,2];

        	player addBackpack _bp;
		clearMagazineCargoGlobal (unitBackpack player);
        	clearItemCargoGlobal (unitBackpack player);
		//(unitBackpack player) addItemCargoGlobal ["AGM_Clacker", 1];
		//(unitBackpack player) addItemCargoGlobal ["AGM_DefusalKit", 1];
		(unitBackpack player) addItemCargoGlobal [_mine_det, 1];
		(unitBackpack player) addMagazineCargoGlobal [_demo, 2];
	};
	case "ENGI_TW": {
		player adduniform _uniform_tw;
		player addheadgear _helmet_tw;
		player addvest _vest_gl_tw;
		Player addgoggles _goggles;
		player addweapon _bino;

		player addweapon _carbine;

		{player addmagazine _carbine_mag} foreach [1,2,3,4,5,6];
		player addmagazine _carbine_mag_tr;
		{player addmagazine _smoke} foreach [1,2];
		{player addmagazine _smoke_green} foreach [1,2];

        	player addBackpack _bp__tw;
		clearMagazineCargoGlobal (unitBackpack player);
        	clearItemCargoGlobal (unitBackpack player);
		//(unitBackpack player) addItemCargoGlobal ["AGM_Clacker", 1];
		//(unitBackpack player) addItemCargoGlobal ["AGM_DefusalKit", 1];
		(unitBackpack player) addItemCargoGlobal [_mine_det, 1];
		(unitBackpack player) addMagazineCargoGlobal [_demo, 2];
	};
	case "TCCC": {
		player adduniform _uniform_med_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_ar;
		player addgoggles _goggles_lowpro;

		{player addmagazine _epi} foreach [1,2];
		{player addmagazine _morphine} foreach [1,2];
		{player addmagazine _atropine} foreach [1,2];
		{player addmagazine _chestseal} foreach [1,2];
		{player addmagazine _quickclot} foreach [1,2,3,4];
		{player addmagazine _packing} foreach [1,2,3,4];
		{player addmagazine _elastic} foreach [1,2,3,4];
		{player addmagazine _bandage} foreach [1,2,3,4,5,6,7];
		{player addmagazine _tourniquet} foreach [1,2];
		{player addmagazine _npa} foreach [1,2,3];
		{player addmagazine _opa} foreach [1,2,3];

		player addweapon _rifle;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		{player addmagazine _grenade} foreach [1,2];
		{player addmagazine _smoke;} foreach [1,2,3];
		player addmagazine _smoke_green;
		player addmagazine _smoke_red;

        	player addBackpack _bp;
		clearMagazineCargoGlobal (unitBackpack player);
        	clearItemCargoGlobal (unitBackpack player);
        	(unitBackpack player) addMagazineCargoGlobal [_smoke, 3];
		(unitBackpack player) addMagazineCargoGlobal [_bandage, 14];
		(unitBackpack player) addMagazineCargoGlobal [_tourniquet, 5];
		(unitBackpack player) addMagazineCargoGlobal [_morphine, 10];
		(unitBackpack player) addMagazineCargoGlobal [_epi, 8];
		(unitBackpack player) addMagazineCargoGlobal [_chestseal, 6];
		(unitBackpack player) addMagazineCargoGlobal [_quickclot, 6];
		(unitBackpack player) addMagazineCargoGlobal [_atropine, 8];
		(unitBackpack player) addMagazineCargoGlobal [_packing, 6];
		(unitBackpack player) addMagazineCargoGlobal [_elastic, 6];
		(unitBackpack player) addMagazineCargoGlobal [_opa, 6];
		(unitBackpack player) addMagazineCargoGlobal [_npa, 6];
		(unitBackpack player) addMagazineCargoGlobal [_saline, 2];
		(unitBackpack player) addMagazineCargoGlobal [_rifle_mag_t, 1];
		(unitBackpack player) addMagazineCargoGlobal [_saline_500, 3];
		(unitBackpack player) addMagazineCargoGlobal [_rifle_mag_t, 1];
	};
	case "TCCC_TW": {
		player adduniform _uniform_med_tw;
		player addheadgear _helmet_tw;
		player addvest _vest_tw;
		player addgoggles _goggles_lowpro;

		{player addmagazine _epi} foreach [1,2];
		{player addmagazine _morphine} foreach [1,2];
		{player addmagazine _atropine} foreach [1,2];
		{player addmagazine _chestseal} foreach [1,2];
		{player addmagazine _quickclot} foreach [1,2,3,4];
		{player addmagazine _packing} foreach [1,2,3,4];
		{player addmagazine _elastic} foreach [1,2,3,4];
		{player addmagazine _bandage} foreach [1,2,3,4,5,6,7];
		{player addmagazine _tourniquet} foreach [1,2];
		{player addmagazine _npa} foreach [1,2,3];
		{player addmagazine _opa} foreach [1,2,3];

		player addweapon _rifle;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		{player addmagazine _grenade} foreach [1,2];
		{player addmagazine _smoke;} foreach [1,2,3];
		player addmagazine _smoke_green;
		player addmagazine _smoke_red;

        	player addBackpack _bp_tw;
		clearMagazineCargoGlobal (unitBackpack player);
        	clearItemCargoGlobal (unitBackpack player);
        	(unitBackpack player) addMagazineCargoGlobal [_smoke, 3];
		(unitBackpack player) addMagazineCargoGlobal [_bandage, 14];
		(unitBackpack player) addMagazineCargoGlobal [_tourniquet, 5];
		(unitBackpack player) addMagazineCargoGlobal [_morphine, 10];
		(unitBackpack player) addMagazineCargoGlobal [_epi, 8];
		(unitBackpack player) addMagazineCargoGlobal [_chestseal, 6];
		(unitBackpack player) addMagazineCargoGlobal [_quickclot, 6];
		(unitBackpack player) addMagazineCargoGlobal [_atropine, 8];
		(unitBackpack player) addMagazineCargoGlobal [_packing, 6];
		(unitBackpack player) addMagazineCargoGlobal [_elastic, 6];
		(unitBackpack player) addMagazineCargoGlobal [_opa, 6];
		(unitBackpack player) addMagazineCargoGlobal [_npa, 6];
		(unitBackpack player) addMagazineCargoGlobal [_saline, 2];
		(unitBackpack player) addMagazineCargoGlobal [_saline_500, 3];
		(unitBackpack player) addMagazineCargoGlobal [_rifle_mag_t, 1];
	};
	case "IC": {
		player adduniform _uniform_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_ar;
		player addweapon _rangefinder;
		player addgoggles _goggles_lowpro;

		player addweapon _rifle_gl;

		player addBackpack _bp_radio;
		clearMagazineCargoGlobal (unitBackpack player);
        	clearItemCargoGlobal (unitBackpack player);

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		player addmagazine _rifle_mag_tr;
		player addmagazine _lmg_mag;
		{player addmagazine _grenade} foreach [1,2,3];
		{player addmagazine _smoke} foreach [1,2];
		player addmagazine _smoke_green;
		player addmagazine _smoke_red;
		{player addmagazine _gl_he} foreach [1,2,3,4];
		{player addmagazine _gl_smoke} foreach [1,2];
		player addmagazine _gl_smoke_red;
		player addmagazine _gl_smoke_green;
	};
	case "IC_TW": {
		player adduniform _uniform_tw;
		player addheadgear _helmet_tw;
		player addvest _vest_tw;
		player addgoggles _goggles_lowpro;
		player addweapon _rangefinder;

		player addweapon _rifle_gl;

		player addBackpack _bp_radio;
		clearMagazineCargoGlobal (unitBackpack player);
        	clearItemCargoGlobal (unitBackpack player);

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		player addmagazine _rifle_mag_tr;
		player addmagazine _lmg_mag;
		{player addmagazine _grenade} foreach [1,2,3];
		{player addmagazine _smoke} foreach [1,2];
		player addmagazine _smoke_green;
		player addmagazine _smoke_red;
		{player addmagazine _gl_he} foreach [1,2,3,4];
		{player addmagazine _gl_smoke} foreach [1,2];
		player addmagazine _gl_smoke_red;
		player addmagazine _gl_smoke_green;
	};
	case "2IC": {
		player adduniform _uniform_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_ar;
		player addgoggles _goggles_lowpro;
		player addweapon _bino;

		player addweapon _rifle;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		player addmagazine _rifle_mag_tr;
		player addmagazine _lmg_mag;
		{player addmagazine _grenade} foreach [1,2,3];
		{player addmagazine _smoke} foreach [1,2];
		player addmagazine _smoke_green;
		player addmagazine _smoke_red;
	};
	case "2IC_TW": {
		player adduniform _uniform_tw;
		player addheadgear _helmet_tw;
		player addvest _vest_tw;
		player addgoggles _goggles_lowpro;
		player addweapon _bino;

		player addweapon _rifle;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		player addmagazine _rifle_mag_tr;
		player addmagazine _lmg_mag;
		{player addmagazine _grenade} foreach [1,2,3];
		{player addmagazine _smoke} foreach [1,2];
		player addmagazine _smoke_green;
		player addmagazine _smoke_red;
	};
	case "OFF": {
		player adduniform _uniform_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_ar;
		player addweapon _rangefinder;
		player addgoggles _goggles_lowpro;

		player addweapon _rifle;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		player addmagazine _rifle_mag_tr;
		{player addmagazine _grenade} foreach [1,2];
		{player addmagazine _smoke} foreach [1,2];
		player addmagazine _smoke_green;
		player addmagazine _smoke_red;

		player addBackpack _bp_radio;
		clearMagazineCargoGlobal (unitBackpack player);
        	clearItemCargoGlobal (unitBackpack player);
	};
	case "OFF_TW": {
		player adduniform _uniform_tw;
		player addheadgear _helmet_tw;
		player addvest _vest_tw;
		player addweapon _rangefinder;
		player addgoggles _goggles_lowpro;

		player addweapon _rifle;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		player addmagazine _rifle_mag_tr;
		{player addmagazine _grenade} foreach [1,2];
		{player addmagazine _smoke} foreach [1,2];
		player addmagazine _smoke_green;
		player addmagazine _smoke_red;

		player addBackpack _bp_radio;
		clearMagazineCargoGlobal (unitBackpack player);
        	clearItemCargoGlobal (unitBackpack player);
	};
	case "RECCE": {
		player adduniform _uniform_sf;
		player addheadgear _helmet_lite;
		player addvest _vest_sf;
		player addgoggles _goggles;
		player addweapon _bino;

		player addweapon _carbine_iur;
		player addweapon _lat;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		player addmagazine _rifle_mag_tr;
		player additem _c8_sup;
		player additem _boonie_hs;
		{player addmagazine _grenade} foreach [1,2];
		{player addmagazine _smoke} foreach [1,2];
		player addmagazine _smoke_green;
		player addmagazine _smoke_red;
	};
	case "RECCE_TW": {
		player adduniform _uniform_tw;
		player addheadgear _helmet_lite;
		player addvest _vest_tw;
		player addgoggles _goggles;
		player addweapon _bino;

		player addweapon _carbine_iur;
		player addweapon _lat;

		{player addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
		player addmagazine _rifle_mag_tr;
		player additem _c8_sup;
		player additem _boonie_hs;
		{player addmagazine _grenade} foreach [1,2];
		{player addmagazine _smoke} foreach [1,2];
		player addmagazine _smoke_green;
		player addmagazine _smoke_red;
	};
	case "CREW": {
	    	player adduniform _uniform_ar;
		player addheadgear _helmet_ar;
		player addvest _vest_ar;
		Player addgoggles _goggles_lowpro;
		player addweapon _bino;

		player addweapon _carbine_cqb;

		{player addmagazine _carbine_mag} foreach [1,2,3,4,5,6];
		{player addmagazine _grenade} foreach [1,2];
		{player addmagazine _smoke;} foreach [1,2];
		player addmagazine _smoke_green;
	};
	case "CREW_TW": {
	    	player adduniform _uniform_tw;
		player addheadgear _helmet_tw;
		player addvest _vest_tw;
		Player addgoggles _goggles_lowpro;
		player addweapon _bino;

		player addweapon _carbine_cqb;

		{player addmagazine _carbine_mag} foreach [1,2,3,4,5,6];
		{player addmagazine _grenade} foreach [1,2];
		{player addmagazine _smoke;} foreach [1,2];
		player addmagazine _smoke_green;
	};
	case "PILOT_HELO": {
	    	player adduniform _uniform_pilot;
		player addheadgear _helmet_pilot_helo;
		player addvest _vest_pilot;
		Player addgoggles _glasses_aviator;
		player addweapon _bino;

		player addweapon _carbine_cqb;

		{player addmagazine _carbine_mag} foreach [1,2,3,4];
		{player addmagazine _grenade;} foreach [1,2];
		{player addmagazine _smoke;} foreach [1,2];
		player addmagazine _smoke_green;
	};
	case "CREW_HELO": {
	    	player adduniform _uniform_ar;
		player addheadgear _helmet_crew_helo;
		player addvest _vest_ar;
		Player addgoggles _glasses_aviator;
		player addweapon _bino;

		player addweapon _carbine_cqb;

		{player addmagazine _carbine_mag} foreach [1,2,3,4];
		{player addmagazine _grenade;} foreach [1,2];
		{player addmagazine _smoke;} foreach [1,2];
		player addmagazine _smoke_green;
	};
};

//accessories
removeAllPrimaryWeaponItems player;
player addPrimaryWeaponItem _elcan;
player addPrimaryWeaponItem _irlaser;

player selectweapon primaryweapon player;
reload player;

//default items
player linkitem "tf_anprc152";
{player addMagazine _bandage} foreach [1,2,3];
player addMagazine _tourniquet;
player addItem _eotech;
player addItem _flashlight;
player linkItem _nvg;
{player addmagazine "Chemlight_red"} foreach [1,2];
{player addmagazine "Chemlight_green"} foreach [1,2,3,4,5];
player linkitem "ItemCompass";
player linkitem "ItemWatch";
player linkitem "ItemGPS";
player linkitem "ItemMap";
