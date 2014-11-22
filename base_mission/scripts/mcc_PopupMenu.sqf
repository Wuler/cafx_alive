private ["_ok"];
disableSerialization;

if (player getVariable ["MCC_allowed",false]) exitWith
{
	if (str findDisplay 2994 != "No display") then
	{
		while {dialog} do {closeDialog 0};
	}
	else
	{
		if (name player != mcc_missionMaker) then
		{
			MCC_mcc_screen = 0;
		}
		else
		{
			if (MCC_mcc_screen == 0) then {MCC_mcc_screen = 2};
		};


		switch (MCC_mcc_screen) do
		{
			case 0:
			{
				//Close Dialog
				if (dialog) exitWith
				{
					while {dialog} do {closeDialog 0};
				};
				_ok = createDialog "mcc_loginDialog";
				if !(_ok) exitWith { hint "createDialog failed" };
			};
			case 1:
			{
				_ok = createDialog "MCC3D_Dialog";
				if !(_ok) exitWith { hint "createDialog failed" };
			};
			case 2:
			{
				_ok = createDialog "mcc_groupGen";
				if !(_ok) exitWith { hint "createDialog failed" };
			};
			case 3:
			{
				_ok = createDialog "MCCMWDialog";
				if !(_ok) exitWith { hint "createDialog failed" };
			};
		};

		MCC_mcc_screen = 0;
	};
};