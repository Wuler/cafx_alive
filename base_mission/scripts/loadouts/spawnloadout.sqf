#include "geardefinitions.hpp"

// Loadouts
removeAllItems _this;
removeAllWeapons _this;
removeAllContainers _this;
removeUniform _this;
removeVest _this;
removeHeadgear _this;
removeAllAssignedItems _this;
removeGoggles _this;

switch toupper(typeof _this) do {
        case "B_ONS_SOLDIER_GL_TW_F":
        {
                _this adduniform _uniform_tw;
                _this addheadgear _helmet_tw;
                _this addvest _vest_tw;
                _this addgoggles _goggles;

                _this addweapon _rifle_gl;

                {_this addmagazine _rifle_mag} foreach [1,2,3,4,5];
                //_this addmagazine _rifle_mag_tr;
                _this addmagazine _lmg_mag;
                {_this addmagazine _grenade} foreach [1];
                {_this addmagazine _smoke} foreach [1];
                {_this addmagazine _gl_he} foreach [1,2,3,4,5,6,7,8];
                {_this addmagazine _gl_smoke} foreach [1,2,3,4];
                _this addmagazine _gl_smoke_red;
                _this addmagazine _gl_smoke_green;

        };
        case "B_ONS_SOLDIER_LMG_TW_F":
        {
                _this adduniform _uniform_long_tw;
                _this addheadgear _helmet_tw;
                _this addvest _vest_gl_tw;
                _this addgoggles _goggles;
                //{_this addItem _sparebarrel} foreach [1,2];

                _this addweapon _lmg;

                {_this addmagazine _lmg_mag} foreach [1,2,3];
                {_this addmagazine _grenade} foreach [1,2];
                {_this addmagazine _smoke} foreach [1,2];
        };
        case "B_ONS_ENGINEER_TW_F":
        {
                _this adduniform _uniform_tw;
                _this addheadgear _helmet_tw;
                _this addvest _vest_gl_tw;
                _this addgoggles _goggles;
                _this addweapon _bino;

                _this addweapon _carbine;

                {_this addmagazine _carbine_mag} foreach [1,2,3,4,5,6];
                _this addmagazine _carbine_mag_tr;
                {_this addmagazine _smoke} foreach [1,2];
                {_this addmagazine _smoke_green} foreach [1,2];

                _this addBackpack _bp_tw;
                clearMagazineCargoGlobal (unitBackpack _this);
                clearItemCargoGlobal (unitBackpack _this);
                //(unitBackpack _this) addItemCargoGlobal ["AGM_Clacker", 1];
                //(unitBackpack _this) addItemCargoGlobal ["AGM_DefusalKit", 1];
                (unitBackpack _this) addItemCargoGlobal [_mine_det, 1];
                (unitBackpack _this) addMagazineCargoGlobal [_demo, 2];
        };
        case "B_ONS_SOLDIER_SL_TW_F":
        {
                _this adduniform _uniform_tw;
                _this addheadgear _helmet_tw;
                _this addvest _vest_tw;
                _this addweapon _rangefinder;
                _this addgoggles _goggles_lowpro;

                _this addweapon _rifle;

                {_this addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
                _this addmagazine _rifle_mag_tr;
                _this addmagazine _lmg_mag;
                {_this addmagazine _grenade} foreach [1,2,3];
                {_this addmagazine _smoke} foreach [1,2];
                _this addmagazine _smoke_green;
                _this addmagazine _smoke_red;

                _this addBackpack _bp_tw_radio;
                clearMagazineCargoGlobal (unitBackpack _this);
                clearItemCargoGlobal (unitBackpack _this);
        };
        case "B_ONS_SOLDIER_TL_TW_F":
        {
                _this adduniform _uniform_tw;
                _this addheadgear _helmet_tw;
                _this addvest _vest_tw;
                _this addgoggles _goggles_lowpro;
                _this addweapon _bino;

                _this addweapon _rifle;

                {_this addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
                _this addmagazine _rifle_mag_tr;
                _this addmagazine _lmg_mag;
                {_this addmagazine _grenade} foreach [1,2,3];
                {_this addmagazine _smoke} foreach [1,2];
                _this addmagazine _smoke_green;
                _this addmagazine _smoke_red;
        };
        case "B_ONS_OFFICER_TW_F":
        {
                _this adduniform _uniform_tw;
                _this addheadgear _helmet_tw;
                _this addvest _vest_tw;
                _this addweapon _rangefinder;
                _this addgoggles _goggles_lowpro;

                _this addweapon _rifle_gl;

                _this addBackpack _bp_tw_radio;
                clearMagazineCargoGlobal (unitBackpack _this);
                clearItemCargoGlobal (unitBackpack _this);

                {_this addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
                _this addmagazine _rifle_mag_tr;
                _this addmagazine _lmg_mag;
                {_this addmagazine _grenade} foreach [1,2,3];
                {_this addmagazine _smoke} foreach [1,2];
                _this addmagazine _smoke_green;
                _this addmagazine _smoke_red;
                {_this addmagazine _gl_he} foreach [1,2,3,4];
                {_this addmagazine _gl_smoke} foreach [1,2];
                _this addmagazine _gl_smoke_red;
                _this addmagazine _gl_smoke_green;
        };
        case "B_ONS_MEDIC_TW_F":
        {
                _this adduniform _uniform_med_tw;
                _this addheadgear _helmet_tw;
                _this addvest _vest_tw;
                _this addgoggles _goggles_lowpro;

                {_this addmagazine _epi} foreach [1,2];
                {_this addmagazine _morphine} foreach [1,2];
                {player addmagazine _atropine} foreach [1,2];
                {player addmagazine _chestseal} foreach [1,2];
                {_this addmagazine _quickclot} foreach [1,2,3,4];
                {_this addmagazine _packing} foreach [1,2,3,4];
                {_this addmagazine _elastic} foreach [1,2,3,4];
                {_this addmagazine _bandage} foreach [1,2,3,4,5,6,7];
                {_this addmagazine _tourniquet} foreach [1,2];
                {_this addmagazine _npa} foreach [1,2,3];
                {_this addmagazine _opa} foreach [1,2,3];

                _this addweapon _rifle;

                {_this addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
                {_this addmagazine _grenade} foreach [1,2];
                {_this addmagazine _smoke;} foreach [1,2,3];
                _this addmagazine _smoke_green;
                _this addmagazine _smoke_red;

                _this addBackpack _bp_tw;
                clearMagazineCargoGlobal (unitBackpack _this);
                clearItemCargoGlobal (unitBackpack _this);
                (unitBackpack _this) addMagazineCargoGlobal [_smoke, 3];
                (unitBackpack _this) addMagazineCargoGlobal [_bandage, 14];
                (unitBackpack _this) addMagazineCargoGlobal [_smoke, 3];
                (unitBackpack _this) addMagazineCargoGlobal [_tourniquet, 5];
                (unitBackpack _this) addMagazineCargoGlobal [_morphine, 10];
                (unitBackpack _this) addMagazineCargoGlobal [_epi, 8];
                (unitBackpack _this) addMagazineCargoGlobal [_atropine, 8];
                (unitBackpack _this) addMagazineCargoGlobal [_quickclot, 6];
                (unitBackpack _this) addMagazineCargoGlobal [_chestseal, 6];
                (unitBackpack _this) addMagazineCargoGlobal [_packing, 6];
                (unitBackpack _this) addMagazineCargoGlobal [_elastic, 6];
                (unitBackpack _this) addMagazineCargoGlobal [_opa, 6];
                (unitBackpack _this) addMagazineCargoGlobal [_npa, 6];
                (unitBackpack _this) addMagazineCargoGlobal [_saline_500, 3];
                (unitBackpack _this) addMagazineCargoGlobal [_saline, 2];
                (unitBackpack _this) addMagazineCargoGlobal [_rifle_mag_t, 1];
        };
        case "B_ONS_Helipilot_TW_F":
        {
                _this adduniform _uniform_pilot;
                _this addheadgear _helmet_pilot_helo;
                _this addvest _vest_pilot;
                _this addgoggles _glasses_aviator;
                _this addweapon _bino;

                _this addweapon _carbine_cqb;

                {_this addmagazine _carbine_mag} foreach [1,2,3,4];
                {_this addmagazine _grenade;} foreach [1,2];
                {_this addmagazine _smoke;} foreach [1,2];
                _this addmagazine _smoke_green;
        };
        case "B_ONS_SOLDIER_REPAIR_TW_F":
        {
                _this adduniform _uniform_tw;
                _this addheadgear _helmet_tw;
                _this addvest _vest_tw;
                _this addgoggles _goggles_lowpro;
                _this addweapon _bino;

                _this addweapon _carbine_cqb;

                {_this addmagazine _carbine_mag} foreach [1,2,3,4];
                {_this addmagazine _grenade;} foreach [1,2];
                {_this addmagazine _smoke;} foreach [1,2];
                _this addmagazine _smoke_green;
        };
        case "ONS_CSOG_OPERATOR":
        {
                _this adduniform _uniform_sf;
                _this addheadgear _helmet_lite;
                _this addvest _vest_sf;
                _this addgoggles _goggles;
                _this addweapon _bino;

                _this addweapon _carbine_iur;
                _this addweapon _lat;

                {_this addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
                _this addmagazine _rifle_mag_tr;
                _this additem _c8_sup;
                _this additem _boonie_hs;
                {_this addmagazine _grenade} foreach [1,2];
                {_this addmagazine _smoke} foreach [1,2];
                _this addmagazine _smoke_green;
                _this addmagazine _smoke_red;
        };
        case "ONS_CSOG_OPERATOR_V2":
        {
                _this adduniform _uniform_sf;
                _this addheadgear _helmet_lite;
                _this addvest _vest_sf;
                _this addgoggles _goggles;
                _this addweapon _bino;

                _this addweapon _carbine_iur;
                _this addweapon _lat;

                {_this addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
                _this addmagazine _rifle_mag_tr;
                _this additem _c8_sup;
                _this additem _boonie_hs;
                {_this addmagazine _grenade} foreach [1,2];
                {_this addmagazine _smoke} foreach [1,2];
                _this addmagazine _smoke_green;
                _this addmagazine _smoke_red;
        };
        case "ONS_CSOG_MEDIC":
        {
                _this adduniform _uniform_sf;
                _this addheadgear _helmet_lite;
                _this addvest _vest_sf;
                _this addgoggles _goggles;
                _this addweapon _bino;

                _this addweapon _carbine_iur;
                _this addweapon _lat;

                {_this addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
                _this addmagazine _rifle_mag_tr;
                _this additem _c8_sup;
                _this additem _boonie_hs;
                {_this addmagazine _grenade} foreach [1,2];
                {_this addmagazine _smoke} foreach [1,2];
                _this addmagazine _smoke_green;
                _this addmagazine _smoke_red;
        };
        case "ONS_CSOG_LMG":
        {
                _this adduniform _uniform_sf;
                _this addheadgear _helmet_lite;
                _this addvest _vest_sf;
                _this addgoggles _goggles;
                _this addweapon _bino;

                _this addweapon _carbine_iur;
                _this addweapon _lat;

                {_this addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
                _this addmagazine _rifle_mag_tr;
                _this additem _c8_sup;
                _this additem _boonie_hs;
                {_this addmagazine _grenade} foreach [1,2];
                {_this addmagazine _smoke} foreach [1,2];
                _this addmagazine _smoke_green;
                _this addmagazine _smoke_red;
        };
        case "ONS_CSOG_MARKSMAN":
        {
                _this adduniform _uniform_sf;
                _this addheadgear _helmet_lite;
                _this addvest _vest_sf;
                _this addgoggles _goggles;

                _this addweapon _marksman;
                _this addweapon _lat;

                {_this addmagazine _marksman_mag} foreach [1,2,3,4,5,6];
                _this addmagazine _rifle_mag_tr;
                _this additem _c8_sup;
                _this additem _boonie_hs;
                {_this addmagazine _grenade} foreach [1,2];
                {_this addmagazine _smoke} foreach [1,2];
                _this addmagazine _smoke_green;
                _this addmagazine _smoke_red;
        };
        default {
                _this adduniform _uniform_tw;
                _this addheadgear _helmet_tw;
                _this addvest _vest_tw;
                _this addgoggles _goggles;

                _this addweapon _rifle;
                _this addweapon _lat;

                {_this addmagazine _rifle_mag} foreach [1,2,3,4,5,6];
                _this addmagazine _rifle_mag_tr;
                _this addmagazine _lmg_mag;
                {_this addmagazine _grenade} foreach [1,2,3];
                {_this addmagazine _smoke} foreach [1,2];
                _this addmagazine _smoke_green;
        };
};

removeAllPrimaryWeaponItems _this;
_this addPrimaryWeaponItem _elcan;
_this addPrimaryWeaponItem _irlaser;

_this selectweapon primaryweapon _this;
reload _this;

_this linkitem "tf_anprc152";
{_this addMagazine _bandage} foreach [1,2,3];
_this addMagazine _tourniquet;
_this addItem _eotech;
_this addItem _flashlight;
_this linkItem _nvg;
{_this addmagazine "Chemlight_red"} foreach [1,2];
{_this addmagazine "Chemlight_green"} foreach [1,2,3,4,5];
_this linkitem "ItemCompass";
_this linkitem "ItemWatch";
_this linkitem "ItemGPS";
_this linkitem "ItemMap";
