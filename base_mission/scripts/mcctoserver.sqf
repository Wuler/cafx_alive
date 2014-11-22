private ["_mishnames","_mishfiles"];

_mishnames = profileNamespace getVariable "MCC_save";
_mishfiles = profileNamespace getVariable "MCC_saveFiles";

smish = [_mishnames,_mishfiles];

publicvariableserver "smish";
