private ["_cutWire", "_compare"];
_cutWire = _this select 0;

_compare = [WIRE, _cutWire] call BIS_fnc_areEqual;

if (_compare) then {
	cutText ["BOMB DEFUSED", "PLAIN DOWN"];
	DEFUSED = true;
	playSound "button_close";
} else {
	cutText ["BOMB ARMED", "PLAIN DOWN"];
	ARMED = true;
	playSound "button_wrong";
};