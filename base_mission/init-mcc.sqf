mccPresetsObjects = [
					 ['Pickable Object','_this call MCC_fnc_pickItem;']
					,['Disable Simulation','_this enableSimulation false;']
					,['Destroy Object', '_this setdamage 1;']
					,['Flip Object', '[_this ,0, 90] call bis_fnc_setpitchbank;']
					,['Virtual Ammobox System (VAS)', '_this addAction ["<t color=""#ff1111"">Virtual Ammobox </t>", "'+MCC_path+'VAS\open.sqf"];']
					,['Virtual Arsenal (BIS)', 'if (isServer) then {["AmmoboxInit",[_this,true]] call BIS_fnc_arsenal};']
					,['Loadouts (7CMBG)', '_this execvm "scripts\ammo.sqf"; _this execvm "scripts\arsenal.sqf";']
					,['Medical Facility (CMS)', '_this setvariable ["cse_medical_facility", true, true];']
					,['Medical Vehicle (CMS)', '_this setvariable ["cse_medical_vehicle", true, true];']
					,['Vehicle loadout', '_this execvm "scripts\loadoutfull.sqf";']
					,['Satellite Comms','_this addAction ["SatCOM", {call compile preprocessfilelinenumbers "support\modules\pxs_satcom_oa\start_satellite.sqf"}];']
					,['Defuse Bomb 90s - change code and timer','CODE = [1,2,3,4,5,6]; [_this, 90] spawn COB_fnc_bombTimer; _this allowdamage false; _this addAction ["DEFUSE","scripts\DEFUSE\defuseAction.sqf","",1,true,true,"","(_target distance _this) < 3"];']
					,['Contains bomb code - change The Code','_this addAction [("<t color=""#E61616"">" + ("The Code") + "</t>"),"scripts\DEFUSE\searchAction.sqf","",1,true,true,"","(_target distance _this) < 3";']
					,['Destroyable by satchels only', '_this addEventHandler ["handledamage", {if ((_this select 4) in ["SatchelCharge_Remote_Ammo","DemoCharge_Remote_Ammo"]) then {(_this select 0) setdamage 1;(_this select 3) addRating 1500} else {0}}];']
					,['', '']
					,['======= Effects =======','']
					,['Sandstorm','[_this] call BIS_fnc_sandstorm;']
					,['Flies','[getposatl _this] call BIS_fnc_flies;']
					,['Smoke','if (isServer) then {_effect = "test_EmptyObjectForSmoke" createVehicle (getpos _this);_effect setpos (getpos _this)};']
					,['Fire','if (isServer) then {_effect = "test_EmptyObjectForFireBig" createVehicle (getpos _this);_effect setpos (getpos _this)};']
					,['', '']
					,['======= Misc =======','']
					,['Create Local Marker', '_this execVM "'+MCC_path+'mcc\general_scripts\create_local_marker.sqf";']
					];

Ares_EditableObjectBlacklist = Ares_EditableObjectBlacklist + [
	"ALiVE_sys_GC",
	"ALiVE_sys_adminactions",
	"ALiVE_SYS_spotrep",
	"ALiVE_sys_newsfeed",
	"ALiVE_SYS_marker",
	"ALiVE_SYS_LOGISTICS",
	"ALiVE_SYS_sitrep",
	"ALiVE_SYS_patrolrep",
	"SideOPFOR_F",
	"SideResistance_F",
	"ALiVE_mil_placement",
	"ALiVE_mil_OPCOM",
	"ALiVE_mil_logistics",
	"ALiVE_civ_placement",
	"cse_sys_weaponrest",
	"cse_damage_ai",
	"cse_sys_gestures",
	"ALiVE_SYS_LOGISTICSDISABLE",
	"ALiVE_sys_profile",
	"cse_sys_winddeflection",
	"cse_sys_medical",
	"ALiVE_MIL_C2ISTAR",
	"ALiVE_SUP_PLAYER_RESUPPLY",
	"cse_sys_attachableItems",
	"cse_sys_logistics",
	"ALiVE_amb_civ_placement",
	"ALiVE_amb_civ_population",
	"cse_sys_magazineRepack",
	"cse_sys_advanced_interaction",
	"ALiVE_mil_cqb",
	"cse_sys_groups",
	"cse_sys_backblast",
	"mcc_sandbox_moduleGAIASettings",
	"ALiVE_require",
	"cse_sys_tags",
	"cse_sys_nightvision",
	"mcc_sandbox_moduleMissionSettings",
	"mcc_sandbox_moduleCover",
	"Logic",
	"ModuleCurator_F"
];

//ARES hack to save full map (radius 50m)
Ares_fnc_objectsgrabber = compile preprocessFileLineNumbers "functions\fn_objectsgrabber.sqf";

if (isserver) then {
	//[] spawn {
		private ["_mccobjects","_aresobjects"];
		_mccobjects = [];
		_aresobjects = [];
		//waituntil {sleep 0.5; MCC_initDone};
		switch tolower(worldname) do {
		    case "altis": {
				_mccobjects = [["EMPTY","B_Quadbike_01_F",[14332.1,16122.4,0.007164],313.843,""],["EMPTY","RoadCone_L_F",[14368.3,16127,8.39233e-005],48.9041,""],["EMPTY","RoadCone_L_F",[14382.9,16117.1,4.95911e-005],48.8269,""],["EMPTY","RoadCone_L_F",[14379.3,16113.4,4.57764e-005],48.7425,""],["EMPTY","RoadCone_L_F",[14384.5,16118.8,4.57764e-005],48.7906,""],["EMPTY","RoadCone_L_F",[14388,16122.5,6.67572e-005],48.7581,""],["EMPTY","RoadCone_L_F",[14370.5,16129.2,7.24792e-005],48.7287,""],["EMPTY","RoadCone_L_F",[14386.3,16120.7,7.43866e-005],49.0046,""],["EMPTY","RoadCone_L_F",[14381.2,16115.2,4.76837e-005],48.7715,""],["EMPTY","RoadCone_L_F",[14372.1,16130.9,8.01086e-005],48.7836,""],["EMPTY","RoadCone_L_F",[14373.9,16132.7,4.95911e-005],48.9179,""],["EMPTY","RoadCone_L_F",[14366.5,16125.2,0.000112534],48.8954,""],["EMPTY","RoadCone_L_F",[14375.6,16134.5,-0.000148773],48.365,""],["EMPTY","RoadCone_L_F",[14353.7,16137.4,0.00041008],48.6897,""],["EMPTY","RoadCone_L_F",[14377.7,16111.6,4.76837e-005],48.8195,""],["EMPTY","RoadCone_L_F",[14352.1,16135.7,0.000389099],48.8019,""],["EMPTY","RoadCone_L_F",[14364.8,16123.5,9.91821e-005],48.9394,""],["EMPTY","RoadCone_L_F",[14362.3,16146.4,0.00133514],48.6742,""],["EMPTY","RoadCone_L_F",[14355.6,16139.2,0.000162125],48.8136,""],["EMPTY","RoadCone_L_F",[14360.7,16144.7,0.00126076],48.8255,""],["EMPTY","B_Quadbike_01_F",[14327.9,16118.3,0.00619507],313.381,""],["EMPTY","RoadCone_L_F",[14358.9,16142.9,0.00169945],48.7443,""],["EMPTY","B_Quadbike_01_F",[14322,16112.2,0.00757599],313.557,""],["EMPTY","RoadCone_L_F",[14357.2,16141.1,0.0018158],48.7831,""],["EMPTY","B_Quadbike_01_F",[14324,16114.2,0.00627899],313.525,""],["EMPTY","ONS_lav3_isc_F",[14380.8,16191.8,0.0719261],220.933,""],["EMPTY","B_Quadbike_01_F",[14334.1,16124.4,0.00542831],312.935,""],["EMPTY","ONS_lav3_isc_F",[14374.4,16197.3,0.0712585],220.847,""],["EMPTY","B_Quadbike_01_F",[14325.9,16116.4,0.00367928],313.492,""],["EMPTY","B_Heli_Light_01_armed_F",[14426.8,16187.7,0.0165043],316.119,""],["EMPTY","ONS_lav3_isc_F",[14307.3,16224.9,0.0779743],185.231,""],["EMPTY","ONS_lav3_isc_F",[14299.2,16225.4,0.0713177],185.386,""],["EMPTY","B_Quadbike_01_F",[14330.2,16120.5,0.00721931],313.579,""],["EMPTY","ONS_lav3_isc_F",[14315.4,16224.3,0.0743828],183.766,""],["EMPTY","CAF_CH146_GRIFFON_F",[14247.7,16135.6,0.00202179],44.4774,""],["EMPTY","ONS_lav3_isc_F",[14361.9,16207.7,0.151993],222.207,""],["EMPTY","CAF_CH146_F",[14379.7,16247.7,-0.0116711],29.271,""],["EMPTY","CAF_CH146_F",[14310.6,16267.5,-0.0202007],359.865,""],["EMPTY","CAF_CH146_F",[14274.4,16260.1,0.00400162],333.172,""],["EMPTY","CAF_CH146_F",[14345.9,16261.8,0.00243568],19.3302,""],["EMPTY","B_Heli_Light_01_armed_F",[14440,16200.8,0.0103245],316.265,""],["EMPTY","RoadCone_L_F",[15204.7,17244.4,4.19617e-005],320.027,""],["EMPTY","B_Heli_Light_01_F",[14453.3,16213.7,0.00919914],314.638,""],["EMPTY","RoadCone_L_F",[15194.4,17229.8,4.19617e-005],319.688,""],["EMPTY","ONS_lav3_isc_F",[14355.7,16213.1,0.0681801],221.829,""],["EMPTY","ONS_lav3_isc_F",[14350.3,16219,0.0766983],222.238,""],["EMPTY","ONS_lav3_isc_F",[14368.4,16202.4,0.0711327],220.886,""],["EMPTY","RoadCone_L_F",[15189,17235.6,4.19617e-005],319.851,""],["EMPTY","RoadCone_L_F",[15203.1,17246.1,4.19617e-005],319.916,""],["EMPTY","RoadCone_L_F",[15192.7,17231.5,4.19617e-005],319.699,""],["EMPTY","RoadCone_L_F",[15190.9,17233.5,4.19617e-005],319.638,""],["EMPTY","RoadCone_L_F",[15206.6,17242.8,4.19617e-005],319.465,""],["EMPTY","RoadCone_L_F",[15201.2,17247.8,4.19617e-005],319.819,""],["EMPTY","B_Heli_Transport_03_F",[14316.4,16329.4,0.000528336],178.716,""],["EMPTY","B_Heli_Transport_03_unarmed_F",[14374.3,16319.7,0.00803185],205.366,""],["EMPTY","O_Heli_Transport_04_bench_F",[14425.2,16294.9,-0.00167656],212.645,""],["EMPTY","B_MRAP_01_F",[14255.4,16158.3,0.00863075],131.058,""],["EMPTY","CAF_CH146_SF",[15154.9,17266,-0.00976944],220.878,""],["EMPTY","B_Heli_Transport_03_unarmed_F",[15122.7,17295.8,-0.0209255],220.776,""],["EMPTY","B_Heli_Transport_01_F",[15096.2,17184.5,0.200733],47.7428,""]];
			};
			case "bornholm": {
				_aresobjects = [["B_Truck_01_ammo_F",[12014.2,13011.2,65.6543],44.3831,1,0],["Land_HBarrierBig_F",[12018.9,13011,64.961],135.295,1,0],["Land_HBarrierBig_F",[12013.5,13004.8,65.6819],134.901,1,0],["B_Truck_01_fuel_F",[12023,13020.7,64.6852],44.1468,1,0],["Land_HBarrierBig_F",[12024.7,13016.9,64.4257],135.171,1,0],["B_Truck_01_transport_F",[11991.2,13031.3,66.4572],41.5879,1,0],["Land_HBarrierBig_F",[12030.4,13023.1,63.905],135.059,1,0],["B_Truck_01_transport_F",[11982.5,13021.5,67.4124],39.9391,1,0],["cse_medical_supply_crate_cms",[12016.9,13041,62.6789],359.796,1,0.0124945],["Land_HBarrierBig_F",[11987.3,13035.1,65.6466],312.146,1,0],["B_G_Quadbike_01_F",[11996.5,12991.9,67.8346],341.811,1,0],["Land_HBarrierBig_F",[11982.1,13028.4,66.2536],309.409,1,0],["B_Truck_01_Repair_F",[12032.6,13031,64.3051],43.8396,1,0],["B_G_Quadbike_01_F",[11995.1,12989.9,68.0494],341.721,1,0],["Land_HBarrierBig_F",[11976.5,13021.9,66.9053],310.988,1,0],["Land_HBarrierBig_F",[12036.3,13029.5,63.4091],135.065,1,0],["B_G_Quadbike_01_F",[11993.2,12987.9,68.2893],341.824,1,0],["Land_HBarrierBig_F",[11996,12986.5,68.0619],134.899,1,0],["Land_HelipadSquare_F",[12026.5,12988.3,65.8195],312.122,1,0],["B_G_Quadbike_01_F",[11991.6,12985.8,68.5005],341.685,1,0],["B_G_Offroad_01_armed_F",[11988.9,12985.1,69.3319],343.78,1,0],["Land_HelipadCircle_F",[11977.3,12994.9,67.1303],314.952,1,0],["Land_HBarrierBig_F",[11969.7,13022.6,67.1129],221.373,1,0],["Land_HelipadSquare_F",[12045.3,13008.5,63.3116],312.582,1,0],["Land_HBarrierBig_F",[12042.1,13035.9,62.7663],135.201,1,0],["Land_CncBarrierMedium4_F",[11978.8,13045.4,65.08],310.916,1,0],["Land_CncBarrierMedium4_F",[11974.1,13039.8,65.5604],310.608,1,0],["Land_HBarrierBig_F",[11990.3,12980.3,68.7965],135.117,1,0],["CamoNet_BLUFOR_big_F",[11974.4,12993.3,69.488],224.746,1,0],["B_G_Offroad_01_armed_F",[11984.8,12981.6,69.8148],343.911,1,0],["Land_HBarrierBig_F",[11978.8,13051.5,65.0762],221.29,1,0],["Land_HBarrierBig_F",[11963.2,13007,68.2645],132.882,1,0],["Land_HelipadRescue_F",[12033.6,13054.4,61.2027],316.317,1,0],["Land_HBarrierBig_F",[11963.3,13028.3,67.0214],221.453,1,0],["Land_HBarrierBig_F",[12047.6,13041.9,62.1672],134.957,1,0],["B_G_Offroad_01_F",[11980.9,12977.6,69.6965],338.522,1,0],["Land_HelipadSquare_F",[12009.2,12968.7,67.4843],311.912,1,0],["Land_HBarrierBig_F",[11984.1,12974.1,69.5321],135.133,1,0],["B_G_Offroad_01_repair_F",[11961,12994.8,69.5644],137.985,1,0],["Land_HBarrierBig_F",[11957.5,13000.5,68.9831],134.111,1,0],["Land_HBarrierBig_F",[11970,12980.2,69.7821],227.558,1,0],["Land_HBarrierBig_F",[11976.2,12974,69.8658],227.609,1,0],["Land_HBarrierBig_F",[11972,13057.1,65.0647],221.476,1,0],["Land_HBarrierBig_F",[11963.8,12986.3,69.7328],227.428,1,0],["Land_HBarrierBig_F",[11956.6,13034,66.8662],221.48,1,0],["Land_CncBarrierMedium4_F",[11961.6,13045.8,65.6732],313.189,1,0],["Land_HBarrierBig_F",[12047.5,12980.6,67.4048],134.581,1,0],["Land_Cargo_Patrol_V1_F",[11953.7,13006.1,72.5996],43.0812,1,0],["Land_HBarrierBig_F",[12053.4,13047.5,61.6289],135.475,1,0],["Land_HBarrierBig_F",[12042.2,12974.4,68.2433],134.911,1,0],["Land_HBarrierBig_F",[12053.4,12986.6,66.4885],134.306,1,0],["Land_HBarrierBig_F",[11982.5,12967.8,70.1521],227.68,1,0],["Land_HBarrierBig_F",[11957.8,12992.5,69.6307],227.488,1,0],["Land_CncBarrierMedium4_F",[11956.4,13040.2,66.1904],313.229,1,0],["cse_medical_supply_crate_cms",[12049.3,13055,60.6386],127.059,1,0.00720124],["Land_HBarrierBig_F",[12036.5,12968.2,68.8914],135.233,1,0],["Land_HelipadSquare_F",[12063.3,13028.9,60.7519],312.493,1,0],["Land_HBarrierBig_F",[12059.1,12992.8,65.5923],134.672,1,0],["Land_Medevac_house_V1_F",[12051.9,13055.1,60.8331],43.8825,1,0],["Land_HBarrierBig_F",[11988.6,12961.6,70.4669],227.629,1,0],["Land_HBarrierBig_F",[11951.6,12998.9,69.3381],227.665,1,0],["Land_HBarrierBig_F",[12030.6,12962.2,69.3101],135.399,1,0],["Land_HBarrierBig_F",[12064.9,12999.1,64.7431],134.34,1,0],["Land_HBarrierBig_F",[11949.8,13039.5,66.6781],221.554,1,0],["Land_HBarrierBig_F",[11965.2,13062.6,64.7705],221.671,1,0],["Land_HBarrierBig_F",[12058.6,13052.8,61.0684],135.526,1,0],["Land_HBarrierBig_F",[11945.5,13005.2,69.0952],227.705,1,0],["Land_HBarrierBig_F",[11994.8,12955,70.5865],227.566,1,0],["Land_HBarrierBig_F",[12024.6,12956.1,69.6814],135.083,1,0],["Land_HBarrierBig_F",[12070.7,13005.5,63.6853],134.858,1,0],["Land_HBarrierBig_F",[12049.9,13065.9,61.1729],227.45,1,0],["Land_HBarrierBig_F",[12056.2,13059.8,60.9266],227.467,1,0],["Land_HBarrierBig_F",[12043.8,13072.1,61.4341],227.52,1,0],["Land_HBarrierBig_F",[12062.5,13053.6,60.7886],227.471,1,0],["Land_BagBunker_Small_F",[11953,13055.5,65.2209],130.026,1,0],["Land_HBarrierBig_F",[11957,13061.2,64.9575],313.339,1,0],["Land_HBarrierBig_F",[11962.2,13067.2,64.4958],313.439,1,0],["Land_HBarrierBig_F",[12018.9,12950,70.0875],135.331,1,0],["Land_HBarrierBig_F",[12037.8,13078.2,61.5528],227.602,1,0],["Land_HBarrierBig_F",[12068.6,13047.3,60.6041],227.381,1,0],["Land_HBarrierBig_F",[11939.3,13011.5,68.6979],227.806,1,0],["Land_HBarrierBig_F",[12000.9,12948.9,70.6109],227.56,1,0],["Land_HBarrierBig_F",[11967.8,13073.2,63.9904],313.418,1,0],["Land_HBarrierBig_F",[12076.3,13011.6,62.8326],134.485,1,0],["Land_BarGate_F",[11947.1,13050.9,68.6825],310.641,1,0],["B_HMG_01_F",[11943.2,13043.1,69.1216],313.499,1,0],["Land_HBarrierBig_F",[11974.7,13078.8,63.4535],327.666,1,0],["Land_HBarrierBig_F",[11974.7,13078.8,63.4535],327.714,1,0],["Land_HBarrierBig_F",[11974.7,13078.8,63.4535],327.748,1,0],["cse_medical_supply_crate_cms",[11938.3,13029.4,66.471],57.098,1,0],["Land_BagBunker_Tower_F",[11941.6,13041.6,67.4124],39.9645,1,0],["Land_HBarrierBig_F",[11982.2,13083.4,63.0693],327.732,1,0],["Land_HBarrierBig_F",[12074.8,13040.8,60.4802],227.492,1,0],["ONS_Rifles_Box",[11936.6,13028.1,66.418],319.249,1,0],["Land_HBarrierBig_F",[12031.5,13084.7,61.4323],227.625,1,0],["CamoNet_INDP_open_Curator_F",[11936.2,13027.9,67.3555],132.74,1,0],["Land_HBarrierBig_F",[11989.6,13087.9,62.6341],327.777,1,0],["cse_medical_supply_crate_cms",[11934.8,13026.2,66.6283],43.5192,1,0],["Land_HBarrierBig_F",[12013.1,12944,70.574],135.449,1,0],["Land_HBarrierBig_F",[11933.3,13017.6,68.0973],226.901,1,0],["Land_HBarrierBig_F",[12006.9,12942.7,70.7841],227.64,1,0],["Land_HBarrierBig_F",[12082,13017.2,62.0502],134.794,1,0],["Land_HBarrierBig_F",[12080.8,13034.8,60.5744],227.576,1,0],["Land_HBarrierBig_F",[11934.1,13036.2,66.597],313.453,1,0],["Land_HBarrierBig_F",[12025.5,13090.9,61.3012],227.607,1,0],["Land_HBarrierBig_F",[11997.1,13092.5,62.2818],327.898,1,0],["Land_Cargo_Patrol_V1_F",[12013.9,13093.8,65.2566],225.681,1,0],["Land_HBarrierBig_F",[12004.4,13096.9,61.9372],327.97,1,0],["Land_HBarrierBig_F",[11928.3,13029.9,66.7447],313.573,1,0],["Land_HBarrierBig_F",[12086.9,13028.7,60.7804],227.584,1,0],["Land_HBarrierBig_F",[11927.1,13023.8,66.9943],227.903,1,0],["Land_HBarrierBig_F",[12087.9,13023.1,61.2899],134.94,1,0],["Land_HBarrierBig_F",[12019.3,13097.3,61.3322],227.534,1,0],["Land_HBarrierBig_F",[12016.6,13100.1,61.3999],226.675,1,0],["Land_HBarrierBig_F",[12010.9,13100.7,61.5811],327.774,1,0],["Land_HelipadSquare_F",[13971.5,10607.6,85.7298],267.31,1,0],["rhs_uaz_vdv",[13836.3,10561.8,87.4408],179.296,1,0],["Land_BagFence_Long_F",[13825.5,10642.9,85.5894],91.7527,1,0],["Land_BagFence_Round_F",[13823.6,10639.2,85.5884],360,1,0],["Land_Hangar_F",[13819.5,10582.6,91.3808],266.353,1,0],["Land_HelipadSquare_F",[13969,10643.7,86.4435],267.3,1,0],["Land_Shed_Small_F",[13828.1,10562.4,87.9631],86.7909,1,0],["Land_BagFence_Round_F",[13823.9,10646.4,85.5883],180,1,0],["Land_HelipadSquare_F",[13972.6,10573.6,84.7139],267.32,1,0],["Land_BagFence_Round_F",[13818.8,10638.9,85.6015],5.7125e-007,1,0],["Land_BagFence_Round_F",[13819.1,10646.1,85.6031],180,1,0],["Land_BagFence_Round_F",[13814.3,10639.2,85.6012],5.71248e-007,1,0],["rhs_uaz_vdv",[13820.1,10561.6,87.576],179.143,1,0],["Land_BagFence_Round_F",[13814.5,10645.8,85.6019],180,1,0],["Land_BagFence_Long_F",[13812.2,10642.5,85.606],91.7525,1,0],["Land_HelipadSquare_F",[13967.3,10679.2,86.4351],267.3,1,0],["rhs_btr60_vdv",[13803.9,10559.9,87.8798],177.1,1,0],["Land_Shed_Small_F",[13803.3,10560.6,88.3482],85.7656,1,0],["rhs_t72bc_tv",[13860,10501.2,87.8879],346.411,1,0],["Land_HelipadSquare_F",[14011.9,10609.8,85.9958],267.327,1,0],["Land_Shed_Big_F",[13851.9,10498.6,89.3845],256.653,1,0],["Land_HelipadSquare_F",[14010.5,10645.9,86.6497],267.311,1,0],["Land_HelipadSquare_F",[14013.4,10575.4,85.4073],267.327,1,0],["CamoNet_INDP_open_Curator_F",[13802.7,10514.7,88.8889],78.6858,1,0],["Land_HelipadSquare_F",[14008,10682.3,87.0671],267.302,1,0],["Land_TentHangar_V1_F",[13860.3,10473.8,90.4789],77.6325,1,0],["CamoNet_INDP_open_Curator_F",[13811.9,10496.9,90.5971],230.715,1,0],["ALiVE_mil_logistics",[14034.9,10668.3,87.382],265.641,1,0],["Land_Cargo_Tower_V1_No1_F",[13799,10490.3,102.696],97.5437,1,0],["Land_HelipadRescue_F",[13970.8,10751,86.5629],268.107,1,0],["Land_Medevac_house_V1_F",[14005.7,10753.5,87.7312],91.0467,1,0],["Land_i_Barracks_V2_F",[13963.2,10786.8,87.4313],359.73,1,0],["Land_Medevac_HQ_V1_F",[13995,10784.1,91.0222],271.335,1,0],["Land_HBarrier_Big_F",[12976.5,10220.1,109.152],150.829,1,0],["Land_BagBunker_Large_F",[12966.6,10219.1,108.838],331.541,1,0],["Land_BagFence_Long_F",[12981.9,10222.7,108.248],153.425,1,0],["Land_HBarrier_5_F",[12970.4,10203.2,108.619],241.317,1,0],["Land_BagFence_Long_F",[12959.9,10211.2,108.179],153.382,1,0],["Land_BagFence_Long_F",[12984.7,10224,108.345],153.425,1,0],["Land_HBarrier_5_F",[12965.9,10203.1,108.626],152.444,1,0],["Land_BagFence_Long_F",[12957.1,10211,108.168],194.054,1,0],["Land_BagFence_Long_F",[12987.3,10225.3,108.484],154.958,1,0],["Land_HBarrier_5_F",[12968.1,10198.8,108.629],152.252,1,0],["Land_BagFence_Long_F",[12954.9,10212.8,108.16],62.3072,1,0],["Land_BagFence_Long_F",[12989.1,10227.4,108.422],113.262,1,0],["Land_HBarrier_5_F",[12957.7,10201.4,108.542],291.41,1,0],["Land_HBarrier_Big_F",[12952.5,10217.9,108.994],63.5285,1,0],["Land_BagBunker_Tower_F",[12974.7,10237,117.289],237.594,1,0],["Land_BagFence_Long_F",[12989.4,10230.2,108.404],255.92,1,0],["Land_HBarrier_Big_F",[12987.7,10235.3,109.07],242.145,1,0],["Land_HBarrier_5_F",[12957.9,10196,108.505],241.329,1,0],["Land_HBarrier_Big_F",[12962.6,10238.2,109.369],328.723,1,0],["Land_BagBunker_Small_F",[13008.9,10237.8,108.784],223.737,1,0],["Land_BagFence_Long_F",[13005.6,10243.8,108.224],47.5278,1,0],["Land_BagFence_Long_F",[13007.6,10241.7,108.214],224.608,1,0],["Land_BagFence_Long_F",[13017.7,10230.4,108.208],47.5273,1,0],["Land_BagFence_Long_F",[13019.7,10228.3,108.204],47.5191,1,0],["Land_BagFence_Round_F",[13021.3,10226,108.197],259.156,1,0],["Land_HBarrier_Big_F",[12882.5,10218.1,107.724],81.161,1,0],["Land_HBarrier_Big_F",[12889.3,10250.1,107.968],112.908,1,0],["Land_BagBunker_Tower_F",[12886.1,10241.8,108.96],13.0216,1,0],["Land_BagFence_Long_F",[12881.2,10223.9,106.933],79.5686,1,0],["Land_BagBunker_Small_F",[12990,10124,108.083],347.758,1,0],["Land_BagFence_Long_F",[13060,10181.9,107.661],217.045,1,0],["Land_BagFence_Long_F",[12880.9,10226.9,106.876],88.6392,1,0],["Land_BagFence_Long_F",[13001.5,10125.1,107.425],168.21,1,0],["Land_BagFence_Round_F",[13007.1,10126.8,107.506],313.755,1,0],["Land_BagFence_Round_F",[12983.9,10121.2,107.445],25.9639,1,0],["Land_BagFence_Long_F",[13004.4,10125.8,107.408],168.034,1,0],["Land_BagFence_Long_F",[12986.8,10121.3,107.491],168.028,1,0],["Land_BagFence_Long_F",[13061.3,10179.4,107.686],267.136,1,0],["Land_BagFence_Long_F",[13060.8,10176.5,107.656],296.879,1,0],["Land_BagFence_Long_F",[13035,10134.7,107.799],15.0288,1,0],["Land_BagFence_Long_F",[13037.7,10134.7,107.531],344.757,1,0],["Land_BagFence_Long_F",[13040.1,10136.1,107.431],311.559,1,0],["Land_BagFence_Long_F",[12933.4,10108.4,105.826],168.031,1,0],["Land_BagBunker_Small_F",[12929.3,10109.4,106.274],345.645,1,0],["Land_BagFence_Long_F",[12919.6,10105.2,105.246],168.166,1,0],["Land_BagFence_Round_F",[12916.8,10104.9,105.259],21.3807,1,0],["Land_BagBunker_Small_F",[12921.8,10344.6,108.346],149.125,1,0],["Land_BarGate_F",[12927.6,10349.5,111.463],149.775,1,0],["Land_BagFence_Long_F",[12933.8,10353.1,107.792],152.368,1,0],["Land_BagBunker_Small_F",[13229.2,10065,100.358],284.561,1,0],["Land_BarGate_F",[13227.5,10057.5,103.473],106.06,1,0],["Land_BagFence_Long_F",[13225.7,10051.1,99.6471],105.328,1,0],[12021.2,13002.1,64.4653],[1]];
			};
		};
		if ((count _mccobjects) > 0) then {
			private ["_objectData","_class","_pos","_vehicle"];
			{
				_objectData = _x;
				//_side 	= _objectData select 0;
				_class	= _objectData select 1;
				_pos	= _objectData select 2;
				//_group = createGroup sidelogic;

				//if (tolower _side == "empty") then
				//{
					_vehicle = createvehicle [_class,_pos,[],0,"none"];
				//}
				//else
				//{
				//	_vehicle = _group createUnit [_class, _pos, [], 0, "NONE"];
				//};

				_vehicle setposATL _pos;
				_vehicle setDir (_objectData select 3);
				_vehicle setposATL _pos;
				sleep 0.01;

				MCC_curator addCuratorEditableObjects [[_vehicle],false];

				if (_objectData select 4 != "") then
				{
					_vehicle setVariable ["vehicleinit",(_objectData select 4),true];
					[[[netID _vehicle,_vehicle], (_objectData select 4)], "MCC_fnc_setVehicleInit", true, false] spawn BIS_fnc_MP;
				};
			} forEach _mccobjects;
		};

		if ((count _aresobjects) > 0) then {
			private "_createdUnits";
			_createdUnits = [objNull,_aresobjects]call Ares_fnc_ObjectsMapper;
			[_createdUnits] call Ares_fnc_AddUnitsToCurator;
		};
	//};
};