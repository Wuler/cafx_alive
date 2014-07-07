private ["_loader"];
_loader = _this select 0;

truckzid1 = _loader addAction [("<t color=""#FF0000"">" + "Infantry Loadout" + "</t>"),"scripts\vehloadout.sqf",1];
truckzid2 = _loader addAction [("<t color=""#FF0000"">" + "Weapons Det Loadout" + "</t>"),"scripts\vehloadout.sqf",2];
truckzid3 = _loader addAction [("<t color=""#FF0000"">" + "Medical Loadout" + "</t>"),"scripts\vehloadout.sqf",3];