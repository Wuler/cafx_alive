player createDiaryRecord["Diary", ["Info", "<br/>Author - Maj S.Morency<br/>Commander<br/>The Canadian Guards, ACoy"]];
player createDiaryRecord["Diary", ["7CMBG and Teamspeak", "<br/>Website - www.7cmbg.enjin.com<br/><br/>Teamspeak ID: 192.99.33.121<br/>Password: "]];
player createDiaryRecord["Diary", ["Testing Info", "<br/>this server is dedicated"]];

player createDiaryRecord["Diary", ["Escalation of Force", "<br/>
1. Raise arms, showing the individual in question you are armed.<br/>
2. Fire a round in the vicinity of the individual or vehicle in order to stop them.<br/>
3. If the individual or vehicle continues toward the unit disable them and search them or<br/>
4. Shoot to kill."]];

player createDiaryRecord["Diary", ["Rules of Engagement", "<br/>
1. All Soldiers are authorized to defend themselves from anyone determined as a threat.<br/>
2. Civilians- Do not detain civilians unless 
	a. They are in a hostile area and it is best for their safety, 
	b. Confirmed IED presence and/or hostiles possible or 
	c. Operation protocol has been determined to detain and search an area. Always un-cuff civilians following securing of an area.<br/>
3. Hostile- Avoid unnecessary force. Detain surrendered personnel. Avoid collateral damage.<br/>
4. See EOF for further information."]];

player createDiaryRecord["Diary", ["Radio Frequencies", "<br/>
1. HQ- Long Range, 48.8.<br/>
2. Air Det- Long Range, 57.7.<br/>
3. 1 Platoon HQ- Short Range, 187.<br/>
4. 1 Platoon 1 Section- Short Range, 288.<br/>
5. 1 Platoon 2 Section- Short Range, 311.<br/>
6. 2 Platoon Recce Det- Short Range, 195.<br/>
7. 3 Platoon HQ- Short Range, 174.<br/><br/>
8. 3 Platoon 1 Section- Short Range, 220.<br/>
9. 3 Platoon 2 Section- Short Range, 385.<br/>"]];

player createDiarySubject["Airsupport","Air Support"];
player createDiaryRecord["Airsupport", ["CCA 5-Liner", "
CLOSE COMBAT ATTACK BRIEF (Ground to Air)<br/>
<br/>
DO NOT transmit line numbers. All lines are mandatory readback items.<br/>
<br/>
<br/>
1. Observer/Warning Order:<br/>
<br/>
”______. THIS IS ______. FIRE MISSION. OVER.”<br/>
(Aircraft)      (Observer C/S)<br/>
<br/>
<br/>
2. Friendly Location/Mark:<br/>
<br/>
“MY POSITION ______. MARKED BY ______. OVER.”<br/>
       (TRP, Grid, etc.)      (Smoke, Chemlight, Map, etc.)<br/>
<br/>
<br/>
3. Target Location:<br/>
<br/>
“__________________________.”<br/>
(Bearing/Range, TRP, Grid, etc.) <br/>
<br/>
<br/>
4. Target Intel:<br/>
<br/>
“____________. MARKED BY ____________. OVER.”<br/>
(Target Description)    (Smoke, Laser, Tracer, etc.)<br/>
<br/>
<br/>
5. Remarks:<br/>
“_______________________________________.” <br/>
(Threats, Clearance, Restrictions, At My Command, etc.)<br/>
<br/>
<br/>
AS REQUIRED:<br/>
- Clearance: Transmission of the CCA brief is clearance to fire (unless Danger Close). For closer fire, the observer/commander must accept responsibility for increased risk. State “CLEARED DANGER CLOSE” on line 5.<br/>
<br/>
- At my command: For positive control of the guns, state “AT MY COMMAND” on line 5. The gunship will call “READY FOR FIRE” when ready."]];

player createDiaryRecord["Airsupport", ["CAS 9-Liner", "
CLOSE AIR SUPPORT (Ground to Air)<br/>
<br/>
DO NOT transmit line numbers. Lines 4 and 6 and any restrictions are mandatory readback items.<br/>
<br/>
“JTAC:_______. this is _______.<br/>
    (Aircraft C/S)       (JTAC)<br/>
<br/>
Type_______Control______”<br/>
   (1,2 or 3)<br/>
<br/>
1. IP/BP:    “______________”<br/>
             (IP/BP to target)<br/>
2. Heading:  “______________Offset: L/R______________”<br/>
<br/>
3. Distance: “______________”<br/>
         (IP/BP to target in meters)<br/>
4. Target elevation: “______________”<br/>
<br/>
5. Target description: “______________”<br/>
<br/>
6. Target location: “______________”<br/>
               (grid or offsets or visual)<br/>
7. Type mark: “______________”<br/>
               (WP, laser, IR)<br/>
8. Friendlies: “____________Marked by: ___________”<br/>
           (direction and distance)<br/>
9. “Egress: ______________”<br/>
            (cardinal / CP)<br/>
<br/>
Remarks (As appropriate): “_______________________”<br/>
<br/>
Laser to target line: “_____________(degrees)”<br/>
<br/>
Time on Target (TOT): “_____________”<br/>
<br/>
Time-to-Target (TTT): “Stand by______Plus______, Hack.”<br/>
                       (Minutes)______(Seconds)______"]];

player createDiaryRecord["Airsupport", ["HLZB 6-Liner", "
HELICOPTER LANDING ZONE BRIEF (Ground to Air)<br/>
<br/>
DO NOT transmit line numbers. All lines are mandatory readback items.<br/>
<br/>
<br/>
1. Observer/Warning Order:<br/>
<br/>
”_______.THIS IS______.STANDBY FOR_______LZ. OVER.”<br/>
(Aircraft)    (Observer C/S)    (Cargo, Pickup, Insert, CASEVAC)<br/>
<br/>
<br/>
2. LZ Location:<br/>
<br/>
“LZ ______ POSITION ______.”<br/>
(LZ name)      (TRP, Grid, etc.)<br/>
<br/>
<br/>
3. LZ Intel:<br/>
“____________. MARKED BY ____________. OVER.”<br/>
(LZ Description)      (Smoke, Chemlight, Map, etc.)<br/>
<br/>
<br/>
4. Enemy Situation:<br/>
<br/>
“__________________________.”<br/>
(Type, Bearing/Range, TRP, Grid, Mark, etc.)<br/>
<br/>
<br/>
5. Friendly Situation:<br/>
<br/>
“__________________________.”<br/>
(Type, Bearing/Range, TRP, Grid, Mark, etc.)<br/>
<br/>
<br/>
6. Remarks:<br/>
“_______________________________________.” <br/>
(Approach, Hazards, Restrictions, AMMOCAS, Supplies, etc.)"]];

player createDiaryRecord["Airsupport", ["A/C Check-in", "<br/>
AIRCRAFT CHECK-IN BRIEF (Air to Ground)<br/>
<br/>
<br/>
F - Formation C/S<br/>
<br/>
N - Number / Type of A/C<br/>
<br/>
F - Fuel (playtime)<br/>
<br/>
A - Ammunition<br/>
<br/>
L - Logistics<br/>
<br/>
Special capabilities (NVG, FLIR)"]];

player createDiaryRecord["Airsupport", ["BDA", "
BATTLE DAMAGE ASSESSMENT (Air to Ground)<br/>
<br/>
DO NOT transmit line numbers. All lines are mandatory readback items.<br/>
<br/>
<br/>
1. Aircraft C/S:<br/>
<br/>
”______. THIS IS ______. BDA. OVER.”<br/>
(Observer)     (Aircraft)<br/>
<br/>
<br/>
2. Target Location:<br/>
<br/>
“__________________________.”<br/>
(Bearing/Range, TRP, Grid, etc.) <br/>
<br/>
<br/>
3. BDA Results:<br/>
<br/>
“__________________________.”"]];