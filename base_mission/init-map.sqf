private "_tpvar";
{
	call {
		// respawn box
		if ((_x find "respawn" > -1) || (_x find "ammo" > -1)) exitWith {

			// spawn box serverside
			if (isserver) then {
				private "_crate";
				_crate = "cse_medical_supply_crate_cms" createvehicle getmarkerpos _x;
				_crate setdir (markerDir _x);
				crate = _crate;
				publicvariable "crate";
			};
			sleep 1;
			// add loadouts & arsenal
			crate execvm "scripts\ammo.sqf";
			crate execvm "scripts\arsenal.sqf";

			if ((paramsarray select 3) < 2) then {

				crate addAction ["<t color=""#ff1111"">Virtual Ammobox </t>", "\mcc_sandbox_mod\VAS\open.sqf"];
				crate addAction ["<t color=""#ff1111"">Loadouts</t>", "createDialog 'VAS_Load_Diag'"];
			};
		};

		if (isserver) then {

			// vehicle service
			if (_x find "service" > -1) exitWith {
				private "_service";
				_service = "USMC_WarfareBVehicleServicePoint" createvehicle getmarkerpos _x;
				_service setdir (markerDir _x);
			};

			// tp flags
			if (_x find "tp" > -1) exitWith {
				private ["_tpflag","_tpname"];

				// create flag at tp marker with name
				_tpflag = "Land_FieldToilet_F" createvehicle getmarkerpos _x;
				_tpflag setdir (markerDir _x);
				_tpname = markertext _x;

				// flag array
				if isnil("_tpvar") then {

					// first flag, create array
					_tpvar = [[_tpflag,_tpname]];

				} else {

					// not first flag, add to array
					_tpvar pushback [_tpflag,_tpname];
				};
		    };
		};
	};
} foreach allmapmarkers;

if (isserver) then {

	// public tp array
	if isnil("_tpvar") then {

		_tpvar = [];
	};

	tpvar = _tpvar;
	publicvariable "tpvar";
};

sleep 1;

if (!isdedicated) then {

	// clients wait tp array
	waituntil {!isnil "tpvar"};
	_tpvar = tpvar;

	{
		private ["_tpactions","_y"];

		//add action for every other flag
		_tpactions = _tpvar - [_x];
		_y = _x select 0;
		{
			_y addaction [format ["Teleport - %1", (_x select 1)],"scripts\teleport.sqf",[(_x select 0)]];
		} foreach _tpactions;

	} foreach _tpvar;
};