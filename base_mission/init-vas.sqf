//VAS config
[] spawn {
waituntil {sleep 1; VAS_init_complete};

VAS_fnc_handleItem = compile preprocessfilelinenumbers "functions\fn_handleItem.sqf";

//Allow player to respawn with his loadout? If true unit will respawn with all ammo from initial save! Set to false to disable this and rely on other scripts!
vas_onRespawn = true;
//Preload Weapon Config?
vas_preload = true;
//If limiting weapons its probably best to set this to true so people aren't loading custom loadouts with restricted gear.
vas_disableLoadSave = false;
//Amount of save/load slots
vas_customslots = 14; //9 is actually 10 slots, starts from 0 to whatever you set, so always remember when setting a number to minus by 1, i.e 12 will be 11.
//Disable 'VAS hasn't finished loading' Check !!! ONLY RECOMMENDED FOR THOSE THAT USE ACRE AND OTHER LARGE ADDONS !!!
vas_disableSafetyCheck = false;

/*
	NOTES ON EDITING!
	YOU MUST PUT VALID CLASS NAMES IN THE VARIABLES IN AN ARRAY FORMAT, NOT DOING SO WILL RESULT IN BREAKING THE SYSTEM!
	PLACE THE CLASS NAMES OF GUNS/ITEMS/MAGAZINES/BACKPACKS/GOGGLES IN THE CORRECT ARRAYS! TO DISABLE A SELECTION I.E
	GOGGLES vas_goggles = [""]; AND THAT WILL DISABLE THE ITEM SELECTION FOR WHATEVER VARIABLE YOU ARE WANTING TO DISABLE!

														EXAMPLE
	vas_weapons = ["srifle_EBR_ARCO_point_grip_F","arifle_Khaybar_Holo_mzls_F","arifle_TRG21_GL_F","Binocular"];
	vas_magazines = ["30Rnd_65x39_case_mag","20Rnd_762x45_Mag","30Rnd_65x39_caseless_green"];
	vas_items = ["ItemMap","ItemGPS","NVGoggles"];
	vas_backpacks = ["B_Bergen_sgg_Exp","B_AssaultPack_rgr_Medic"];
	vas_goggles = [""];

												Example for side specific (TvT)
	switch(playerSide) do
	{
		//Blufor
		case west:
		{
			vas_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
			vas_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
			vas_goggles = ["G_Diving"]; //Remove diving goggles from VAS
		};
		//Opfor
		case west:
		{
			vas_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
			vas_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
			vas_goggles = ["G_Diving"]; //Remove diving goggles from VAS
		};
	};
*/

//If the arrays below are empty (as they are now) all weapons, magazines, items, backpacks and goggles will be available

if ((paramsarray select 3) == 0) then {vas_weapons = [];vas_magazines = [];vas_items = [];vas_backpacks = [];vas_goggles = [];} else {

	vas_weapons =
	[
	    //rifles
	    "ONS_C7A2",
	    "ONS_C7A2_M203",
	    "ons_c9a2",
	    "caf_c6gpmg",
		"ONS_C8A2",
		"ONS_C8A2_AR",
		"ONS_C8A2_M203",
		"ONS_C8A2_M203_AR",
		"ONS_C8A3",
	    "ONS_C8A3_M203",
	    "ONS_C8A3_CQB",
        "RH_mk12mod1",

	    //launchers
	    "caf_m72a6",
	    "CAF_M2CG"
	];

	vas_magazines =
	[
		//CSE mags
		"cse_weather_meter",
		"cse_Keycuffs",
		"cse_HIIDE",
		"cse_wires",

    	//pistolmags
        "13Rnd_mas_9x21_Mag",

		//riflemags
	    "30Rnd_556X45_NATO",
		"30Rnd_556x45_T_stanag",
	    "220Rnd_762x51_belt",
	    "200Rnd_556x45_Box",
	    "20Rnd_762x51_Mag",

		"5Rnd_mas_762x51_Stanag",

	    //GL
	    "3Rnd_UGL_FlareWhite_F",
	    "3Rnd_UGL_FlareRed_F",
	    "3Rnd_UGL_Flarepurple_F",
	    "3Rnd_UGL_FlareGreen_F",
	    "1Rnd_HE_Grenade_shell",
	    "1Rnd_Smoke_Grenade_shell",
	    "1Rnd_SmokeGreen_Grenade_shell",
	    "1Rnd_SmokeRed_Grenade_shell",
	    "1Rnd_SmokeBlue_Grenade_shell",
	    "1Rnd_SmokeYellow_Grenade_shell",
	    "1Rnd_SmokePurple_Grenade_shell",
	    "1Rnd_SmokeOrange_Grenade_shell",
	    "FFV551_HEAT",
	    "FFV441_HEDP",
	    "FFV551C_HEAT",
	    "FFV502_HEDP",
	    "FFV545C_ILLUM",
	    "FFV469C_SMOKE",
		"RDS_2Rnd_TOW",
	    "RDS_6Rnd_TOW2",
	    "RDS_6Rnd_TOW_HMMWV",
	    "8Rnd_82mm_Mo_shells",
	    "8Rnd_82mm_Mo_Flare_white",
	    "8Rnd_82mm_Mo_Smoke_white",
	    "RDS_48Rnd_40mm_MK19",

	    //grenades
	    "HandGrenade",
	    "smokeshell",
	    "smokeshellgreen",
	    "smokeshellred",
	    "smokeshellblue",
	    "smokeshellyellow",
	    "smokeshellpurple",
	    "smokeshellorange",

	    //chemlights
	    "Chemlight_green",
	    "Chemlight_red",
	    "Chemlight_yellow",
	    "Chemlight_blue",
		"B_IR_Grenade",

        //explosives
	    "ATMine_Range_Mag",
        "APERSMine_Range_Mag",
        "APERSBoundingMine_Range_Mag",
        "SLAMDirectionalMine_Wire_Mag",
	    "APERSTripMine_Wire_Mag",
	    "ClaymoreDirectionalMine_Remote_Mag",
	    "DemoCharge_Remote_Mag",
	    "SatchelCharge_Remote_Mag",

	    "Laserbatteries"
	];

	//CSE meds
		vas_magazines = vas_magazines + [
			"cse_bandage_basic",
			"cse_packing_bandage",
			"cse_tourniquet",
			"cse_splint",
			"cse_morphine",
			"cse_atropine",
			"cse_epinephrine",
			"cse_plasma_iv",
			"cse_plasma_iv_500",
			"cse_plasma_iv_250",
			"cse_blood_iv",
			"cse_blood_iv_500",
			"cse_blood_iv_250",
			"cse_saline_iv",
			"cse_saline_iv_500",
			"cse_saline_iv_250",
			"cse_quikclot",
			"cse_nasopharyngeal_tube",
			"cse_opa",
			"cse_bandageElastic",
			"cse_liquidSkin",
			"cse_chestseal",
			"cse_personal_aid_kit"
		];

	vas_items =
	[
	    //stuff
		"ItemRadio",
	    "ItemMap",
	    "ItemCompass",
	    "ItemWatch",
	    "ItemGPS",
	    "ItemcTabHCam",
	    "B_UavTerminal",
	    "ToolKit",
	    "Minedetector",
		"NVGoggles",
	    "NVGoggles_INDEP",
	    "NVGoggles_OPFOR",
		"tf_rf7800str",
	    "tf_anprc152",

	    //binos
	    "Laserdesignator",
	    "Rangefinder",
	    "Binocular",

	    //attachments
        "muzzle_snds_L",
	    "RH_peq2",
	    "RH_peq15",
	    "acc_flashlight",
	    "acc_pointer_IR",
	    "RH_eotech553",
	    "optic_elcan3d",
	    "optic_elcan",
	    "optic_elcan_arid",
	    "optic_elcan_wood",
	    "optic_elcan_arctic",
	    "optic_carryhandle",

	    //uniforms
	    "U_ons_uniform1_cadpatAR",
	    "U_ons_uniform1_cadpatTW",
	    "U_ons_uniform2_cadpatAR",
	    "U_ons_uniform2_cadpatTW",
	    "U_CAF_uniform3_cadpatTW",
	    "U_CAF_uniform1_cadpat_MIX",
	    "U_CAF_uniform2_cadpat_MIX",
	    "U_ons_GhilleSuit_AR",
	    "U_ons_GhilleSuit_TW",
	    "U_CANSOFCOM_CombatUniform_01_MCAM",
	    "U_CANSOFCOM_CombatUniform_02_MCAM",
	    "U_RCAF_146_HeliPilotCoveralls",
	    "U_RCAF_146_HeliPilotCoveralls_AR",
	    "U_RCAF_147_HeliPilotCoveralls",
	    "U_RCAF_147_HeliPilotCoveralls_AR",

	    //vests
		"ONS_V_TacVest01_AR",
		"ONS_V_TacVest01_TW",
		"ONS_V_TacVest02_AR",
		"ONS_V_TacVest02_TW",
		"V_TacVest_oli",
		"V_RebreatherB",

	    //helmets
	    "ONS_Helmet_AR_B",
	    "ONS_Helmet_TW_B",
	    "H_Cap_oli",
	    "H_Cap_tan",
	    "H_Beret_grn",
	    "H_Beret_blk",
	    "H_Beret_brn_SF",
	    "H_Beret_grn_SF",
	    "H_Booniehat_khk",
	    "H_Booniehat_tan",
	    "H_Booniehat_dirty",
	    "H_Booniehat_grn",
		"H_ons_Boonie_AR",
		"H_Watchcap_blk"
	];

	vas_backpacks =
	[
		//radios
		"clf_prc117g_ap_multi",
		"clf_nicecomm2_multi",
		"clf_nicecomm2_coy",
		"clf_nicecomm2_prc117g_multi",
		"clf_nicecomm2_prc117g_coy",
		"clf_trc9110",
		"tf_anarc210",
		"tf_rt1523g",

	    "B_ons_Carryall_MEdical",
	    "B_ons_Carryall_MEdical_AR",
	    "B_ons_Carryall",
	    "B_ons_Carryall_AR",
	    "B_ons_AssaultPack_AR",
	    "B_ons_AssaultPack_TW",
	    "B_AssaultPack_mcamo",
	    "B_Kitbag_cbr",
	    "B_Kitbag_mcamo",
	    "B_Bergen_mcamo",
	    "B_AssaultPack_blk",
	    "B_AssaultPack_rgr",
		"B_Kitbag_rgr",
	    "B_TacticalPack_rgr",
	    "B_OutdoorPack_tan",
	    "B_Kitbag_mcamo",

	    //statics
	    "RDS_M252_Gun_Bag",
	    "RDS_M252_Bipod_Bag",
	    "RDS_Mk19_Gun_Bag",
	    "RDS_Mk19_Tripod_Bag",
	    "RDS_M2_Gun_Bag",
	    "RDS_M2_Tripod_Bag",
	    "RDS_M2_MiniTripod_Bag",
	    "RDS_Tow_Gun_Bag",
	    "RDS_TOW_Tripod_Bag",
		"ons_tac50_Gun_Bag",
		"ons_tac50_Barrel_Bag"
	];

	vas_glasses =
	[
	//goggles
		"G_Aviator",
		"G_Combat",
		"G_Lowprofile",
		"G_Diving",
		"G_Tactical_Black",
		"G_Tactical_Clear",
		"G_Spectacles",
		"G_Spectacles_Tinted"
	];
};

/*
	NOTES ON EDITING:
	THIS IS THE SAME AS THE ABOVE VARIABLES, YOU NEED TO KNOW THE CLASS NAME OF THE ITEM YOU ARE RESTRICTING. THIS DOES NOT WORK IN
	CONJUNCTION WITH THE ABOVE METHOD, THIs IS ONLY FOR RESTRICTING / LIMITING ITEMS FROM VAS AND NOTHING MORE

														EXAMPLE
	vas_r_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
	vas_r_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
	vas_r_goggles = ["G_Diving"]; //Remove diving goggles from VAS

												Example for side specific (TvT)
	switch(playerSide) do
	{
		//Blufor
		case west:
		{
			vas_r_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
			vas_r_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
			vas_r_goggles = ["G_Diving"]; //Remove diving goggles from VAS
		};
		//Opfor
		case west:
		{
			vas_r_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
			vas_r_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
			vas_r_goggles = ["G_Diving"]; //Remove diving goggles from VAS
		};
	};
*/

//Below are variables you can use to restrict certain items from being used.
//Remove Weapon
vas_r_weapons = [];
vas_r_backpacks = [];
//Magazines to remove from VAS
vas_r_magazines = [];
//Items to remove from VAS
vas_r_items = [];
//Goggles to remove from VAS
vas_r_glasses = [];

};
