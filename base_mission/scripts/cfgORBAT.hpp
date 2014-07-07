class CfgORBAT
{
	class 7thInfantry
	{
		// Unit ID
		id = 7;
		// Unit ID type
		//	0 - show as ordinal number, e.g. "7th" (default)
		//	1 - show as roman numeral, e.g. "VII"
		//	2 - show as NATO phonetical alphabet word, e.g. "Golf"
		idType = 0;
		 // Unit side from CfgChainOfCommand >> Sides
		side = "West";
		 // Unit size from CfgChainOfCommand >> Sizes
		size = "Division";
		 // Unit type from CfgChainOfCommand >> Types
		type = "HQ";

		// Unit insignia, displayed in ORBAT background and in tooltip
		insignia = "\ca\missions_f\data\orbat\7thInfantry_ca.paa";
		// Insignia image color, white by default
		// Can be either RGBA array, or class from CfgMarkerColors
		colorInisgnia[] = {0,0,1,1};

		// Name of unit commander
		// - can be either direct name, or class from CfgWords >> GenericNames (random name from the list is then selected)
		commander = "Armstrong";
		// Rank of unit commander (by default selected based on unit size)
		commanderRank = "GENERAL";
		// Group tags. When opening ORBAT viewer, user can define what tags will be accepted.
		tags[] = {BIS,USArmy,Kerry,Hutchison,Larkin};

		// ALTERNATIVE SETTINGS
		// Custom text and short text, can still use some arguments when defined:
		// 	%1 - ID (e.g. "7th")
		// 	%2 - Type (e.g. "Infantry")
		// 	%3 - Size (e.g. "Division")
		text = "%1 Combat Technology Research %3";
		textShort = "%1 CTR %3";
		// Custom texture, will replace icon set by 'type' param.
		texture = "\ca\missions_f\data\orbat\customTexture_ca.paa";
		// Custom color, will replace color set by 'side' param.
		// Can be either RGBA array, or class from CfgMarkerColors
		color[] = {0,0,1,1};

		// Subordinates, searched on the same level as this class.
		subordinates[] = {2ndBCT};

		// When 'subordinates' are missing, child classes will be used. They can have their own subs - number of tiers is not limited.
		class 1stBCT
		{
			id = 1;
			type = "Armored";
			size = "BCT";
			side = "West";
			commander = "NATOMen";
			tags[] = {"BLUFOR", "USArmy","Kerry"};
 		};
	};
	class 2ndBCT
	{
	};
};