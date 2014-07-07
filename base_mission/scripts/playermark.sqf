_pos = position player;
_date = date;
_timehour = _date select 3;
_timeminute = _date select 4;

_markername = format ["%1:%2", _timehour, _timeminute];

_marker = [_markername, [_pos select 0,_pos select 1], "Icon", [1, 1], "TEXT:", _markername, "TYPE:", "mil_dot", "COLOR:", "ColorBlue"] call CBA_fnc_createMarker;

sleep 60;

deleteMarkerLocal _markername;