//VAS config
[] spawn {
waituntil {sleep 1; VAS_init_complete};

VAS_fnc_handleItem = compile preprocessfilelinenumbers "scripts\fn_handleItem.sqf";

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
    	//pistols
        "hgun_Rook40_F",
    
	    //rifles
	    "caf_C7A2",
	    "caf_C7A2_M203",
	    "caf_c9a2",
	    "caf_C9a2_ar",
	    "caf_C9a2_tw",
	    "caf_C9a2_ac",
	    "caf_c6gpmg",
		"caf_C8A3",
		"CAF_C8A3_arid",
		"caf_C8a3_artic",
		"caf_C8a3_wood",
	    "caf_C8A3_M203",
		"CAF_C8A3_203_arid",
		"CAF_C8A3_203_artic",
		"CAF_C8A3_203_wood",
	    "CAF_C8A3_CQB",
	    "CAF_C8A3_CQB_arid",
	    "CAF_C8A3_CQB_artic",
	    "CAF_C8A3_CQB_wood",
	    "CAF_ar10t",
	    "CAF_ar10t_ar",
	    "CAF_ar10t_tw",
	    "CAF_ar10t_ac",
        "RH_mk12mod1",
	
	    //launchers
	    "caf_m72a6",
	    "CAF_M2CG"
	];
	
	vas_magazines =
	[
    	//pistolmags
        "16Rnd_9x21_Mag",
    
		//riflemags
	    "30Rnd_556X45_NATO",
		"30Rnd_556x45_T_stanag",
		"30Rnd_556x45_Stanag",
	    "220Rnd_762x51_belt",
	    "200Rnd_556x45_Belt",
	    "20Rnd_762x51_Mag",
	
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
	
	vas_items =
	[
	    //stuff
		"ItemRadio",
	    "ItemMap",
	    "ItemCompass",
	    "ItemWatch",
	    "ItemGPS",
	    "ItemcTabHCam",
	    "ItemcTab",
	    "ItemAndroid",
	    "B_UavTerminal",
	    "ToolKit",
	    "Minedetector",
		"caf_MNVG",
		"NVGoggles",
	    "NVGoggles_INDEP",
	    "NVGoggles_OPFOR",
		"tf_rf7800str",
	    "tf_anprc152",
	    "ItemALTIMETER",
		"AGM_SpareBarrel",
		"AGM_UAVBattery",
	
	    //binos
	    "Laserdesignator",
	    "Rangefinder",
	    "Binocular",
	
		//meds
		"AGM_Bandage",
	    "AGM_Morphine",
	    "AGM_Epipen",
	    "AGM_Bloodbag",
		"AGM_EarBuds",
        
	    //attachments
        "muzzle_snds_L",
	    "CAF_muzzle_snds_556_blk",
	    "CAF_muzzle_snds_556_aR",
	    "CAF_muzzle_snds_556_WOOD",
	    "CAF_muzzle_snds_556_ARCTIC",
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
	    "U_CAF_uniform1_cadpatAR",
	    "U_CAF_uniform1_cadpatTW",
	    "U_CAF_uniform2_cadpatAR",
	    "U_CAF_uniform2_cadpatTW",
	    "U_CAF_uniform3_cadpatTW",
	    "U_CAF_uniform1_cadpat_MIX",
	    "U_CAF_uniform2_cadpat_MIX",
	    "U_CAF_GhilleSuit_AR",
	    "U_CAF_GhilleSuit_tw",
	    "U_CANSOFCOM_CombatUniform_01_MCAM",
	    "U_CANSOFCOM_CombatUniform_02_MCAM",
	    "U_RCAF_146_HeliPilotCoveralls",
	    "U_RCAF_146_HeliPilotCoveralls_AR",
	    "U_RCAF_147_HeliPilotCoveralls",
	    "U_RCAF_147_HeliPilotCoveralls_AR",
	
	    //vests
		"V_CAF_PlateCarrier1_AR",
		"V_CAF_PlateCarrier1_TW",
		"V_CAF_PlateCarrier2_AR",
		"V_CAF_PlateCarrier2_TW",
		"V_CAF_Chestrig_AR",
		"V_CAF_Chestrig_TW",
		"V_CANSOFCOM_PlateCarrier1_CBR",
		"V_CANSOFCOM_PlateCarrier2_CBR",
		"V_CANSOFCOM_PlateCarrier3_CBR",
		"V_CAF_Chestrig_CBR",
		"V_TacVest_oli",
		"V_RebreatherB",
	
	    //helmets
		"H_CAF_Boonie_TW",
	    "H_CAF_Boonie_hs_TW",
	    "H_CAF_CG634_AR",
	    "H_CAF_CG634_TW",
	    "H_CAF_CG634_AR_GDN",
	    "H_CAF_CG634_TW_GDN",
	    "H_CAF_CG634_AR_GUP",
	    "H_CAF_CG634_TW_GUP",
	    "H_CAF_CG634_ar_net",
	    "H_CAF_CG634_tw_net",
	    "H_CAF_CG634_AR_net_GDN",
	    "H_CAF_CG634_TW_net_GDN",
	    "H_CAF_CG634_AR_net_GUP",
	    "H_CAF_CG634_TW_net_GUP",
	    "H_CAF_CG634_ar_scrim",
	    "H_CAF_CG634_tw_scrim",
	    "H_CAF_CG634_AR_scrim_GDN",
	    "H_CAF_CG634_TW_scrim_GDN",
	    "H_CAF_CG634_AR_scrim_GUP",
	    "H_CAF_CG634_TW_scrim_GUP",
	    "H_RCAF_CrewHelmetHeli",
	    "H_RCAF_CrewHelmetHeli_01",
	    "H_RCAF_CrewHelmetHeli_02",
	    "H_RCAF_CrewHelmetHeli_03",
	    "H_RCAF_PilotHelmetHeli",
	    "H_CAF_BCAP_01",
		"H_CAF_BCAP_02",
	    "H_Cap_oli",
	    "H_Cap_tan",
	    "H_Beret_grn",
	    "H_CAF_CREWHELMET",
	    "H_Beret_blk",
	    "H_Beret_brn_SF",
	    "H_Beret_grn_SF",
	    "H_Booniehat_khk",
	    "H_Booniehat_tan",
	    "H_Booniehat_dirty",
	    "H_Booniehat_grn",
		"H_CAF_Boonie_AR",
		"H_CAF_Boonie_hs_AR",
		"H_CAF_WatchCap",
		"H_Watchcap_blk"
	];
	
	vas_backpacks =
	[
		"tf_anarc210",
		"tf_rt1523g",
	    "B_CAF_Carryall_MEdical",
	    "B_CAF_Carryall_MEdical_AR",
	    "B_CAF_Carryall",
	    "B_CAF_Carryall_AR",
	    "B_caf_Kitbag_ar",
	    "B_caf_Kitbag_tw",
	    "B_caf_Bergen_ar",
	    "B_caf_Bergen_tw",
	    "B_caf_AssaultPack_AR",
	    "B_caf_AssaultPack_TW",
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
	    "RDS_TOW_Tripod_Bag"
	];
	
	vas_glasses =
	[
	    //goggles
	    "G_Aviator",
	    "G_Combat",
	    "G_Lowprofile",
	    "G_Diving",
	
	    //masks
		"Mask_M40",
		"Mask_M40_OD",
		"Mask_M50",
		"Balaclava_Black",
		"Balaclava_GRY",
		"Balaclava_OD",
		"L_shemagh_white",
		"L_Shemagh_OD",
		"L_Shemagh_Tan",
		"L_Shemagh_Red",
		"L_Shemagh_Gry",
		"LCG_Shemagh_Tan",
		"LBG_Shemagh_Tan",
		"LOG_Shemagh_Tan",
		"LCG_Shemagh_OD",
		"LBG_Shemagh_OD",
		"LOD_Shemagh_OD",
		"LCG_Shemagh_White",
		"LOG_Shemagh_White",
		"LBG_Shemagh_White",
		"LOG_Shemagh_Gry",
		"LCG_Shemagh_Gry",
		"LBG_Shemagh_Gry",
		"NeckTight_Gry",
		"NeckTight",
		"NeckTight_Red",
		"NeckTight_Tan",
		"PU_shemagh_White",
		"PU_shemagh_OD",
		"PU_shemagh_Tan",
		"SAS_Shemagh_Tan",
		"SAS_Shemagh_White",
		"SAS_Shemagh_OD",
		"Shemagh_Face",
		"Shemagh_FaceTan",
		"Shemagh_FaceRed",
		"Shemagh_FaceGry",
		"Shemagh_FaceOD",
		"shemagh_neckD",
		"shemagh_neckOD",
		"Tact_HoodTAN",
		"Tact_HoodMC",
		"Tact_HoodMAR",
		"Tact_HoodACU",
		"Tact_HoodOD"
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