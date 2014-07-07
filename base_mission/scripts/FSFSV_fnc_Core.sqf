/*
FSF_SacVentral
2013-2014

Auteur : ElDoktor, ToF, BeTeP

site : www.clan-fsf.fr
Debug : http://server.clan-fsf.fr:8008/redmine/projects/fsf-server-arma-26
Source : http://server.clan-fsf.fr:8008/redmine/projects/fsf-server-arma-26/repository
*/

//Fonction pour passer le sac du dos vers le ventral
FSFSV_CallBackpackToFront = {
	private ["_pos","_backpack","_size","_array","_FSFSV_SacADosGwh"];
	_pos = [player,1,(getDir player)] call BIS_fnc_relPos;
	_backpack = backpack player;
	_size = sizeof _backpack;
	_array = _pos isFlatEmpty [(_size / 2),0,0.7,_size,0,false,player];
	if (count _array == 0) then {_pos = getPos player;};
	if (count _pos > 0) then {
		_FSFSV_SacADosGwh = "GroundWeaponHolder" createVehicle _pos;
		_FSFSV_SacADosGwh setPos _pos;
		player reveal _FSFSV_SacADosGwh;
		player action ["DropBag",_FSFSV_SacADosGwh,_backpack];
		player forceWalk true;
		sleep 2;
		
		if ((backpack player == "") && !(isNull _FSFSV_SacADosGwh)) then {//anti Action::Process - No target [action: DropBag]
			private ["_positionMemorisee","_positionActualisee","_vehicle"];
			_FSFSV_SacADosGwh attachTo [player,[-0.1,0.8,-0.05],"pelvis"];
			_FSFSV_SacADosGwh setVectorDirAndUp [[0,0,-1],[0,1,0]];
			_positionMemorisee = "vertical";

			player setVariable ["FSFSV_BACKPACK",_FSFSV_SacADosGwh];
			while {!(isNull _FSFSV_SacADosGwh)} do {
				_positionActualisee = (animationState player) call FSFSV_QuellePosition;

				if ((_positionMemorisee != _positionActualisee) && (_positionActualisee != "")) then {
					switch (_positionActualisee) do {
						case "vertical" : {
							_FSFSV_SacADosGwh attachTo [player,[-0.1,0.8,-0.05],"pelvis"];
							_FSFSV_SacADosGwh setVectorDirAndUp [[0,0,-1],[0,1,0]];
						};
						case "horizontallower" : {
							_FSFSV_SacADosGwh attachTo [player,[-0.1,0,-0.72],"pelvis"];
							_FSFSV_SacADosGwh setVectorDirAndUp [[0,-1,-0.15],[0,0,-1]];
						};
						case "horizontalupper" : {
							_FSFSV_SacADosGwh attachTo [player,[-0.1,0.4,0.75],"pelvis"];
							_FSFSV_SacADosGwh setVectorDirAndUp [[0,0.75,-0.25],[0,0.25,0.75]];
						};
					};
					_positionMemorisee = _positionActualisee;
				};

				if (player != vehicle player) then {
					private "_para";
					_vehicle = vehicle player;
					_para = if (_vehicle isKindOf "ParachuteBase") then {true;} else {false;};

					if (_para) then {
						_FSFSV_SacADosGwh attachTo [_vehicle,[-0.12,0.65,-0.15]];
						_FSFSV_SacADosGwh setVectorDirAndUp [[0,-0.2,-1],[0,1,0]];
						//anti-bug Lino, addAction temporarily removed
						player setVariable ["FSFSV_BACKPACK",objNull];
					} else {
						detach _FSFSV_SacADosGwh;
						_FSFSV_SacADosGwh setPos [random 50,random 50,(10000 + (random 50))];
						[[_FSFSV_SacADosGwh,true],"FSFSV_cacheObjet"] call BIS_fnc_MP;
					};

					waitUntil {sleep 0.1;((player == vehicle player) || !(alive player))};

					if (_para) then {
						[[_FSFSV_SacADosGwh,true],"FSFSV_cacheObjet"] call BIS_fnc_MP;
						sleep 5;
						if (alive player) then {player setVariable ["FSFSV_BACKPACK",_FSFSV_SacADosGwh];};
					};
					[[_FSFSV_SacADosGwh,false],"FSFSV_cacheObjet"] call BIS_fnc_MP;
					_positionMemorisee = "out";
				};

				if !(alive player) exitWith {
					private ["_delay","_falling","_speed"];
					//anti-bug collision, shock or other... tempo 100s, if he died in freefall (~3000m)
					_delay = time + 100;
					waitUntil {
						sleep 0.2;
						_vehicle = vehicle player;
						_speed = speed _vehicle;
						_falling = (velocity _vehicle) select 2;
						(((_speed > -1) && (_speed < 1) && (_falling < 0.5) && (_falling > -0.5)) || (time > _delay))
					};
					if !(isNull (attachedTo _FSFSV_SacADosGwh)) then {detach _FSFSV_SacADosGwh;};
					_FSFSV_SacADosGwh setPos (getPos player);
					player setVariable ["FSFSV_BACKPACK",objNull];
				};
				sleep 0.1;
			};
		} else {
			player forceWalk false;
		};
	};
};

//Fonction pour passer le sac du ventral vers le dos
FSFSV_CallBackpackToBack = {
	private "_FSFSV_SacADosGwh";
	_FSFSV_SacADosGwh = player getVariable "FSFSV_BACKPACK";
	detach _FSFSV_SacADosGwh;
	player action ["AddBag",_FSFSV_SacADosGwh,(backpackCargo _FSFSV_SacADosGwh) select 0];
	player setVariable ["FSFSV_BACKPACK",objNull];
	player forceWalk false;
};

//Check si joueur a pied et si l'on peut placer le sac a dos en position ventral
FSFSV_TestPlayerBackpackBack = {
	private "_return";
	_return = false;
	if ((isNull (player getVariable "FSFSV_BACKPACK")) && (backpack player != "") && (vehicle player == player)) then {
		private ["_pos","_iswater"];
		_pos = getPosASL player;
		_iswater = surfaceIsWater _pos;
		if (!(_iswater) || (_iswater && ((_pos select 2) > 0.5))) then {_return = true;};
	};
	_return
};

//Check si joueur a pied et si il y a un sac en position ventral et aucun en position dos
FSFSV_TestPlayerBackpackFront = {
	private "_return";
	_return = if (!(isNull (player getVariable "FSFSV_BACKPACK")) && (backpack player == "") && (vehicle player == player)) then {
		true;
	} else {
		false;
	};
	_return
};

FSFSV_QuellePosition = {
	private "_animationAMemoriser";
	_animationAMemoriser = switch (_this) do {
	     // a genou
	     case "amovpknlmstpsraswrfldnon";
	     case "amovpknlmstpslowwrfldnon";
	     // vertical dans l'eau
	     case "asdvpercmstpsnonwrfldnon";
	     case "asdvpercmstpsnonwnondnon";
		// vertical au sol
		case "amovpercmstpsnonwnondnon";
	     case "amovpercmrunslowwrfldf";
	     case "amovpercmstpslowwrfldnon";
	     case "amovpercmstpsraswrfldnon";
	     case "advepercmstpsnonwnondnon";
	     case "advepercmstpsnonwrfldnon";
	     case "aswmpercmstpsnonwnondnon" : {"vertical";};

		// couche
		case "amovppnemstpsraswrfldnon";
		case "amovppnemsprslowwrfldf";
	     // Free Fall
	     case "halofreefall_non";
	     // Plongeur (nage) horizontal sac dessous
	     case "abdvpercmwlksnonwrfldf";
	     case "asdvpercmwlksnonwrfldf";
	     case "abdvpercmstpsnonwrfldnon";
	     case "advepercmwlksnonwnondf";
	     case "advepercmwlksnonwrfldf";
	     case "aswmpercmwlksnonwnondf" : {"horizontallower";};

		// Plongeur (nage sur le dos) horizontal sac dessus
		case "abdvpercmwlksnonwnondb";
	     case "abdvpercmwlksnonwrfldb";
	     case "advepercmwlksnonwrfldb";
	     case "asdvpercmwlksnonwrfldb" : {"horizontalupper";};

	     // vide par défaut
	     default {"";};
    };
	_animationAMemoriser
};

FSFSV_cacheObjet = compileFinal "(_this select 0) hideObject (_this select 1);";
/*
FSFSV_Player_Init = {
	player forceWalk false;
	player addAction [localize "FSFSV_STR_MettreLeSacEnVentral","0 spawn FSFSV_CallBackpackToFront;","",1.5,false,false,"","call FSFSV_TestPlayerBackpackBack"];
	player addAction [localize "FSFSV_STR_MettreLeSacSurLeDos","0 spawn FSFSV_CallBackpackToBack;","",1.5,false,false,"","call FSFSV_TestPlayerBackpackFront"];
};
*/