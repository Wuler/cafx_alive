private ["_mish","_mishnames","_mishfiles"];

_mish = missionnamespace getvariable "smish";

_mishnames = _mish select 0 + profileNamespace getVariable "MCC_save";
_mishfiles = _mish select 1 + profileNamespace getVariable "MCC_saveFiles";

profileNamespace setVariable ["MCC_save",_mishnames];
profileNamespace setVariable ["MCC_saveFiles",_mishfiles];