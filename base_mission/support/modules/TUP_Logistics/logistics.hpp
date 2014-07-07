///////////////////////////////////////////////////////////////////////
// Add items here if you wish to define the logistics player can order	
// Uncomment the lines below and add items to the array
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
	"Land_Cargo20_military_green_F"	
];

tup_logistics_air = [

	"JS_JC_FA18E",
	"JS_JC_FA18F",
	"CAF_CH146_F",
	"CAF_CH146_F_D",
	"CAF_CH146_SF"
];

tup_logistics_land = [

	"CAF_LeopardC2_TW",
	"CAF_LeopardC2_AR",
	"caf_HLVW_open_AR",
	"caf_HLVW_covered_ar",
	"caf_HLVW_support_ar",
	"caf_lav3_isc_d",
	"caf_TAPV_ar",
	"caf_TAPV_50_ar",
	"caf_TAPV_gl_ar",
	"B_APC_Tracked_01_AA_F",
	"B_Truck_01_ammo_F",
	"B_Truck_01_box_F",
	"B_Truck_01_fuel_F",
	"B_Truck_01_medical_F",
	"B_Truck_01_mover_F",
	"B_Truck_01_Repair_F",
	"B_APC_Tracked_01_CRV_F",
	"B_MRAP_01_F",
	"B_MRAP_01_gmg_F",
	"B_MRAP_01_hmg_F",
	"B_Quadbike_01_F",
	"B_Truck_01_transport_F",
	"B_APC_Wheeled_01_cannon_F",
	"B_APC_Tracked_01_rcws_F"
];

tup_logistics_crate = [

	"AGM_Box_Misc",
	"AGM_Box_Medical",
	"CAF_Optics",
	"CAF_GEAR",
	"CAF_C9A2_AMMO",
	"CAF_C8A3_AMMO",
	"CAF_C7A2_AMMO",
	"CAF_GPMG_AMMO",
	"CAF_carlg_AMMO",
	"B_supplyCrate_F",
	"Box_NATO_Support_F",
	"Box_NATO_Wps_F",
	"Box_NATO_WpsSpecial_F",
	"Box_NATO_Ammo_F",
	"Box_NATO_AmmoOrd_F",
	"Box_NATO_Grenades_F"
];

tup_logistics_static = [

	"RDS_TOW_TriPod_base",
	"RDS_M119_base",
	"RDS_MK19",
	"RDS_M2StaticMG_base",
	"RDS_M2StaticMG_MiniTripod_base",
	"RDS_M252_base"
];

//////////////////////////////////////////
// Set maximum cost allowed per session (default in mission set to 5,000,000 - aircraft are around 400k each)
// tup_logistics_orderlimit = 1000000;

///////////////////////////////////////////////
// Replen Dem
// Add items to the standard Replen Dem order
tup_logistics_replendem = [[1,"CAF_C9A2_AMMO"],[1,"CAF_C7A2_AMMO"],[1,"CAF_GPMG_AMMO"],[1,"CAF_carlg_AMMO"],[1,"x39_medicBox"]];

///////////////////////////////////////////////
// Delay in delivery in seconds
//tup_logistics_delay = 3600;

///////////////////////////////////////////////
// Order Frequency in hours
//tup_logistics_frequency = 12;