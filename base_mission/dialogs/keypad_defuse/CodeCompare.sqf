private ["_code", "_inputCode", "_compare"];
_code = _this select 0;
_inputCode = _this select 1;

_compare = [_code, _inputCode] call BIS_fnc_areEqual;

if (_compare) then {
	cutText ["BOMB DEFUSED", "PLAIN DOWN"];
	DEFUSED = true;
	playSound "button_close";
} else {
	cutText ["BOMB ARMED", "PLAIN DOWN"];
	ARMED = true;
	playSound "button_wrong";
};

CODEINPUT = [];