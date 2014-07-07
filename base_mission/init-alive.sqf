//ALiVE params


//CIV placement

switch (paramsarray select 6) do {
    case 160: {civplace setvariable ["sizeFilter", "160"]};
    case 250: {civplace setvariable ["sizeFilter", "250"]};
    case 400: {civplace setvariable ["sizeFilter", "400"]};
    case 700: {civplace setvariable ["sizeFilter", "700"]};
};

switch (paramsarray select 7) do {
    case 0: {civplace setvariable ["priorityFilter", "0"]};
    case 10: {civplace setvariable ["priorityFilter", "10"]};
    case 30: {civplace setvariable ["priorityFilter", "30"]};
    case 40: {civplace setvariable ["priorityFilter", "40"]};
};

switch (paramsarray select 8) do {
    case 1: {civplace setvariable ["faction", "caf_ag_me_civ"]};
    case 2: {civplace setvariable ["faction", "CIV_F"]};
};

switch (paramsarray select 9) do {
    case 1: {civplace setvariable ["placementMultiplier", "0.5"]};
    case 2: {civplace setvariable ["placementMultiplier", "1"]};
    case 3: {civplace setvariable ["placementMultiplier", "1.5"]};
    case 4: {civplace setvariable ["placementMultiplier", "2"]};
};

switch (paramsarray select 10) do {
    case 1: {civplace setvariable ["ambientVehicleAmount", "0"]};
    case 2: {civplace setvariable ["ambientVehicleAmount", "0.2"]};
    case 3: {civplace setvariable ["ambientVehicleAmount", "0.6"]};
    case 4: {civplace setvariable ["ambientVehicleAmount", "1"]};
};

switch (paramsarray select 11) do {
    case 1: {civplace setvariable ["ambientVehicleFaction", "CIV_F"]};
};


//CIV pop

switch (paramsarray select 12) do {
    case 200: {civpop setvariable ["spawnRadius", "200"]};
    case 300: {civpop setvariable ["spawnRadius", "300"]};
    case 400: {civpop setvariable ["spawnRadius", "400"]};
    case 500: {civpop setvariable ["spawnRadius", "500"]};
    case 600: {civpop setvariable ["spawnRadius", "600"]};
    case 700: {civpop setvariable ["spawnRadius", "700"]};
    case 800: {civpop setvariable ["spawnRadius", "800"]};
    case 900: {civpop setvariable ["spawnRadius", "900"]};
    case 1000: {civpop setvariable ["spawnRadius", "1000"]};
};

switch (paramsarray select 13) do {
    case 0: {civpop setvariable ["spawnTypeHeliRadius", "0"]};
    case 100: {civpop setvariable ["spawnTypeHeliRadius", "100"]};
    case 200: {civpop setvariable ["spawnTypeHeliRadius", "200"]};
    case 300: {civpop setvariable ["spawnTypeHeliRadius", "300"]};
    case 400: {civpop setvariable ["spawnTypeHeliRadius", "400"]};
    case 500: {civpop setvariable ["spawnTypeHeliRadius", "500"]};
    case 600: {civpop setvariable ["spawnTypeHeliRadius", "600"]};
    case 700: {civpop setvariable ["spawnTypeHeliRadius", "700"]};
    case 800: {civpop setvariable ["spawnTypeHeliRadius", "800"]};
    case 900: {civpop setvariable ["spawnTypeHeliRadius", "900"]};
    case 1000: {civpop setvariable ["spawnTypeHeliRadius", "1000"]};
};

switch (paramsarray select 14) do {
    case 0: {civpop setvariable ["spawnTypeJetRadius", "0"]};
    case 100: {civpop setvariable ["spawnTypeJetRadius", "100"]};
    case 200: {civpop setvariable ["spawnTypeJetRadius", "200"]};
    case 300: {civpop setvariable ["spawnTypeJetRadius", "300"]};
    case 400: {civpop setvariable ["spawnTypeJetRadius", "400"]};
    case 500: {civpop setvariable ["spawnTypeJetRadius", "500"]};
    case 600: {civpop setvariable ["spawnTypeJetRadius", "600"]};
    case 700: {civpop setvariable ["spawnTypeJetRadius", "700"]};
    case 800: {civpop setvariable ["spawnTypeJetRadius", "800"]};
    case 900: {civpop setvariable ["spawnTypeJetRadius", "900"]};
    case 1000: {civpop setvariable ["spawnTypeJetRadius", "1000"]};
};

switch (paramsarray select 15) do {
    case 5: {civpop setvariable ["activeLimiter", "5"]};
    case 10: {civpop setvariable ["activeLimiter", "10"]};
    case 15: {civpop setvariable ["activeLimiter", "15"]};
    case 20: {civpop setvariable ["activeLimiter", "20"]};
    case 25: {civpop setvariable ["activeLimiter", "25"]};
    case 30: {civpop setvariable ["activeLimiter", "30"]};
    case 40: {civpop setvariable ["activeLimiter", "40"]};
    case 50: {civpop setvariable ["activeLimiter", "50"]};
};


//CQB

switch (paramsArray select 17) do {
    case 1: {cqbmod setvariable ["CQB_locality_setting", "server"]};
    case 2: {cqbmod setvariable ["CQB_locality_setting", "client"]};
    case 3: {cqbmod setvariable ["CQB_locality_setting", "HC"]};
};

switch (paramsArray select 18) do {
    case 0: {cqbmod setvariable ["CQB_LOCATIONTYPE", "all"]};
    case 1: {cqbmod setvariable ["CQB_LOCATIONTYPE", "towns"]};
};

_cqb_chance = (paramsArray select 19);
cqbmod setvariable ["CQB_spawn_setting", _cqb_chance];
CQB_spawn = _cqb_chance;

_cqb_density = (paramsArray select 20);
cqbmod setvariable ["CQB_DENSITY", _cqb_density];

switch (paramsArray select 21) do {
    case 0: {cqbmod setvariable ["CQB_UseDominantFaction", "false"]};
    case 1: {cqbmod setvariable ["CQB_UseDominantFaction", "true"]};
};

_cqb_distance = (paramsArray select 22);
cqbmod setvariable ["CQB_spawndistance", _cqb_distance];

_cqb_distanceheli = (paramsArray select 23);
cqbmod setvariable ["CQB_spawndistanceHeli", _cqb_distanceheli];

_cqb_distancejet = (paramsArray select 24);
cqbmod setvariable ["CQB_spawndistanceJet", _cqb_distancejet];

switch (paramsArray select 25) do {
    case 0: {cqbmod setvariable ["CQB_FACTIONS_REG", "caf_ag_me_t"]};
    case 1: {cqbmod setvariable ["CQB_FACTIONS_REG", "caf_ag_afr_p"]};
    case 2: {cqbmod setvariable ["CQB_FACTIONS_REG", "Kae_TK"]};
    case 3: {cqbmod setvariable ["CQB_FACTIONS_REG", "Kae_TKguer"]};
    case 4: {cqbmod setvariable ["CQB_FACTIONS_REG", "GME"]};
    case 5: {cqbmod setvariable ["CQB_FACTIONS_REG", "SAA"]};
    case 6: {cqbmod setvariable ["CQB_FACTIONS_REG", "Hezbollah"]};
    case 7: {cqbmod setvariable ["CQB_FACTIONS_REG", "QudsForce"]};
    case 8: {cqbmod setvariable ["CQB_FACTIONS_REG", "drirregularsI"]};
    case 9: {cqbmod setvariable ["CQB_FACTIONS_REG", "Kae_UN"]};
    case 10: {cqbmod setvariable ["CQB_FACTIONS_REG", "Kae_RU"]};
    case 11: {cqbmod setvariable ["CQB_FACTIONS_REG", "Kae_SZ"]};
    case 12: {cqbmod setvariable ["CQB_FACTIONS_REG", "Kae_SZP"]};
};

switch (paramsArray select 26) do {
    case 0: {cqbmod setvariable ["CQB_FACTIONS_STRAT", "caf_ag_me_t"]};
    case 1: {cqbmod setvariable ["CQB_FACTIONS_STRAT", "caf_ag_afr_p"]};
    case 2: {cqbmod setvariable ["CQB_FACTIONS_STRAT", "Kae_TK"]};
    case 3: {cqbmod setvariable ["CQB_FACTIONS_STRAT", "Kae_TKguer"]};
    case 4: {cqbmod setvariable ["CQB_FACTIONS_STRAT", "GME"]};
    case 5: {cqbmod setvariable ["CQB_FACTIONS_STRAT", "SAA"]};
    case 6: {cqbmod setvariable ["CQB_FACTIONS_STRAT", "Hezbollah"]};
    case 7: {cqbmod setvariable ["CQB_FACTIONS_STRAT", "QudsForce"]};
    case 8: {cqbmod setvariable ["CQB_FACTIONS_STRAT", "drirregularsI"]};
    case 9: {cqbmod setvariable ["CQB_FACTIONS_STRAT", "Kae_UN"]};
    case 10: {cqbmod setvariable ["CQB_FACTIONS_STRAT", "Kae_RU"]};
    case 11: {cqbmod setvariable ["CQB_FACTIONS_STRAT", "Kae_SZ"]};
    case 12: {cqbmod setvariable ["CQB_FACTIONS_STRAT", "Kae_SZP"]};
};


//MILCIV pop

switch (paramsarray select 28) do {
    case 0: {milcivpop setvariable ["clusterType", "All"]};
    case 1: {milcivpop setvariable ["clusterType", "HQ"]};
    case 2: {milcivpop setvariable ["clusterType", "Power"]};
    case 3: {milcivpop setvariable ["clusterType", "Comms"]};
    case 4: {milcivpop setvariable ["clusterType", "Fuel"]};
    case 5: {milcivpop setvariable ["clusterType", "Marine"]};
    case 6: {milcivpop setvariable ["clusterType", "Construction"]};
    case 7: {milcivpop setvariable ["clusterType", "Settlement"]};
};

switch (paramsarray select 29) do {
    case 160: {milcivpop setvariable ["sizeFilter", "160"]};
    case 250: {milcivpop setvariable ["sizeFilter", "250"]};
    case 400: {milcivpop setvariable ["sizeFilter", "400"]};
    case 700: {milcivpop setvariable ["sizeFilter", "700"]};
};

switch (paramsarray select 30) do {
    case 0: {milcivpop setvariable ["priorityFilter", "0"]};
    case 10: {milcivpop setvariable ["priorityFilter", "10"]};
    case 30: {milcivpop setvariable ["priorityFilter", "30"]};
    case 40: {milcivpop setvariable ["priorityFilter", "40"]};
};

switch (paramsarray select 31) do {
    case 30: {milcivpop setvariable ["size", "30"]};
    case 60: {milcivpop setvariable ["size", "60"]};
    case 100: {milcivpop setvariable ["size", "100"]};
    case 200: {milcivpop setvariable ["size", "200"]};
    case 400: {milcivpop setvariable ["size", "400"]};
    case 600: {milcivpop setvariable ["size", "600"]};
    case 800: {milcivpop setvariable ["size", "800"]};
};

switch (paramsarray select 32) do {
    case 0: {milcivpop setvariable ["type", "Random"]};
    case 1: {milcivpop setvariable ["type", "Armored"]};
    case 2: {milcivpop setvariable ["type", "Mechanized"]};
    case 3: {milcivpop setvariable ["type", "Motorized"]};
    case 4: {milcivpop setvariable ["type", "Infantry"]};
    case 5: {milcivpop setvariable ["type", "Air"]};
    case 5: {milcivpop setvariable ["type", "Specops"]};
};

switch (paramsarray select 33) do {
    case 0: {milcivpop setvariable ["faction", "caf_ag_me_t"]};
    case 1: {milcivpop setvariable ["faction", "caf_ag_afr_p"]};
    case 2: {milcivpop setvariable ["faction", "Kae_TK"]};
    case 3: {milcivpop setvariable ["faction", "Kae_TKguer"]};
    case 4: {milcivpop setvariable ["faction", "GME"]};
    case 5: {milcivpop setvariable ["faction", "SAA"]};
    case 6: {milcivpop setvariable ["faction", "Hezbollah"]};
    case 7: {milcivpop setvariable ["faction", "QudsForce"]};
    case 8: {milcivpop setvariable ["faction", "drirregularsI"]};
    case 9: {milcivpop setvariable ["faction", "Kae_UN"]};
    case 10: {milcivpop setvariable ["faction", "Kae_RU"]};
    case 11: {milcivpop setvariable ["faction", "Kae_SZ"]};
    case 12: {milcivpop setvariable ["faction", "Kae_SZP"]};
};


//MIL pop

switch (paramsarray select 35) do {
    case 0: {milpop setvariable ["sizeFilter", "0"]};
    case 100: {milpop setvariable ["sizeFilter", "100"]};
    case 200: {milpop setvariable ["sizeFilter", "200"]};
    case 300: {milpop setvariable ["sizeFilter", "300"]};
};

switch (paramsarray select 36) do {
    case 0: {milpop setvariable ["priorityFilter", "0"]};
    case 10: {milpop setvariable ["priorityFilter", "10"]};
    case 30: {milpop setvariable ["priorityFilter", "30"]};
    case 40: {milpop setvariable ["priorityFilter", "40"]};
};

switch (paramsarray select 37) do {
    case 30: {milpop setvariable ["size", "30"]};
    case 60: {milpop setvariable ["size", "60"]};
    case 100: {milpop setvariable ["size", "100"]};
    case 200: {milpop setvariable ["size", "200"]};
    case 400: {milpop setvariable ["size", "400"]};
    case 600: {milpop setvariable ["size", "600"]};
    case 800: {milpop setvariable ["size", "800"]};
};

switch (paramsarray select 38) do {
    case 0: {milpop setvariable ["type", "Random"]};
    case 1: {milpop setvariable ["type", "Armored"]};
    case 2: {milpop setvariable ["type", "Mechanized"]};
    case 3: {milpop setvariable ["type", "Motorized"]};
    case 4: {milpop setvariable ["type", "Infantry"]};
    case 5: {milpop setvariable ["type", "Air"]};
    case 5: {milpop setvariable ["type", "Specops"]};
};

switch (paramsarray select 39) do {
    case 0: {milpop setvariable ["faction", "caf_ag_me_t"]};
    case 1: {milpop setvariable ["faction", "caf_ag_afr_p"]};
    case 2: {milpop setvariable ["faction", "Kae_TK"]};
    case 3: {milpop setvariable ["faction", "Kae_TKguer"]};
    case 4: {milpop setvariable ["faction", "GME"]};
    case 5: {milpop setvariable ["faction", "SAA"]};
    case 6: {milpop setvariable ["faction", "Hezbollah"]};
    case 7: {milpop setvariable ["faction", "QudsForce"]};
    case 8: {milpop setvariable ["faction", "drirregularsI"]};
    case 9: {milpop setvariable ["faction", "Kae_UN"]};
    case 10: {milpop setvariable ["faction", "Kae_RU"]};
    case 11: {milpop setvariable ["faction", "Kae_SZ"]};
    case 12: {milpop setvariable ["faction", "Kae_SZP"]};
};

switch (paramsarray select 40) do {
    case 0: {milpop setvariable ["ambientVehicleAmount", "0"]};
    case 1: {milpop setvariable ["ambientVehicleAmount", "0.2"]};
    case 2: {milpop setvariable ["ambientVehicleAmount", "0.6"]};
    case 3: {milpop setvariable ["ambientVehicleAmount", "1"]};
};


//Profiler

switch (paramsarray select 42) do {
    case 200: {prof setvariable ["spawnRadius", "200"]};
    case 300: {prof setvariable ["spawnRadius", "300"]};
    case 400: {prof setvariable ["spawnRadius", "400"]};
    case 500: {prof setvariable ["spawnRadius", "500"]};
    case 600: {prof setvariable ["spawnRadius", "600"]};
    case 700: {prof setvariable ["spawnRadius", "700"]};
    case 800: {prof setvariable ["spawnRadius", "800"]};
    case 900: {prof setvariable ["spawnRadius", "900"]};
    case 1000: {prof setvariable ["spawnRadius", "1000"]};
};

switch (paramsarray select 43) do {
    case 0: {prof setvariable ["spawnTypeHeliRadius", "0"]};
    case 200: {prof setvariable ["spawnTypeHeliRadius", "200"]};
    case 300: {prof setvariable ["spawnTypeHeliRadius", "300"]};
    case 400: {prof setvariable ["spawnTypeHeliRadius", "400"]};
    case 500: {prof setvariable ["spawnTypeHeliRadius", "500"]};
    case 600: {prof setvariable ["spawnTypeHeliRadius", "600"]};
    case 700: {prof setvariable ["spawnTypeHeliRadius", "700"]};
    case 800: {prof setvariable ["spawnTypeHeliRadius", "800"]};
    case 900: {prof setvariable ["spawnTypeHeliRadius", "900"]};
    case 1000: {prof setvariable ["spawnTypeHeliRadius", "1000"]};
};

switch (paramsarray select 44) do {
    case 0: {prof setvariable ["spawnTypeJetRadius", "0"]};
    case 200: {prof setvariable ["spawnTypeJetRadius", "200"]};
    case 300: {prof setvariable ["spawnTypeJetRadius", "300"]};
    case 400: {prof setvariable ["spawnTypeJetRadius", "400"]};
    case 500: {prof setvariable ["spawnTypeJetRadius", "500"]};
    case 600: {prof setvariable ["spawnTypeJetRadius", "600"]};
    case 700: {prof setvariable ["spawnTypeJetRadius", "700"]};
    case 800: {prof setvariable ["spawnTypeJetRadius", "800"]};
    case 900: {prof setvariable ["spawnTypeJetRadius", "900"]};
    case 1000: {prof setvariable ["spawnTypeJetRadius", "1000"]};
};

switch (paramsarray select 45) do {
    case 20: {prof setvariable ["activeLimiter", "20"]};
    case 30: {prof setvariable ["activeLimiter", "30"]};
    case 40: {prof setvariable ["activeLimiter", "40"]};
    case 50: {prof setvariable ["activeLimiter", "50"]};
    case 60: {prof setvariable ["activeLimiter", "60"]};
    case 80: {prof setvariable ["activeLimiter", "80"]};
    case 100: {prof setvariable ["activeLimiter", "100"]};
};

if ((paramsarray select 46) == 1) then {
    prof setvariable ["persistent", "true"];
};