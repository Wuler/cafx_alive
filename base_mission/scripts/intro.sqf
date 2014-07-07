if(isDedicated || isHC) exitWith{};

[] spawn {

	if (isnil "persistentDBHeader") then {persistentDBHeader = 0};
	if !(persistentDBHeader == 0) then {
	    waituntil {
	        _check = player getvariable "player_intialised";
	        _check == 1;
	    };
	};
	
	sleep 3;
};

#define WELCOME_MESSAGE	"The Multi-Session Operation (MSO) is the ultimate in reality-based gameplay:\n" +\
						"it is a persistent mission simulating real-life warfare \n" +\
						"to the best of our capabilities.\n\n" +\
						"What Now? \n\n" +\
                        "Check your tasks and the notes section for after action reports,\n" +\
                        "upcoming missions and recon information."
[] spawn {
	scriptName "initMission.hpp: mission start";
	[getMarkerPos "respawn_west","Mission Intent:|Bring stability to the Area of Operations,|prosecuting any enemy activity, clearing and securing built up areas|and protecting the civilian population from harm.||This will be achieved by finding and destroying|enemy camps and weapons caches, ambushing supply convoys|and systematically clearing towns and villages across the AO.||Blue Force Tracker is in operation to aid situational awareness,|Intel will automatically mark enemy locations on the map as they are spotted."] spawn BIS_fnc_establishingShot;
	titleText [WELCOME_MESSAGE, "PLAIN", 5];
};