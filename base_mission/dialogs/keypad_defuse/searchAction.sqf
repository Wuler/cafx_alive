 _unit = _this select 0;
 _caller = _this select 1;
 _id = _this select 2;
 
 _caller playMove "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown";
 cutText [format ["Code: %1", CODE], "PLAIN DOWN"];
 
 _unit removeAction _id;