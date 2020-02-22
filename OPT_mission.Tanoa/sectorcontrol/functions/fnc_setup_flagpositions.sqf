/*
Diese Datei enthält alle Flaggenpositionen aufgeteilt in NATO und CSAT.
Jede Flagge besitzt Koordinaten (x,y) sowie die owner Seite, die im Besitz der Flagge ist.
Demnach muss nach jeder Schlacht nur der owner angepasst werden.
west -> Angriffsziel für CSAT
east -> Angriffsziel für NATO
*/
#include "script_component.hpp"

GVARMAIN(nato_flags_pos) = [

// Basis 
	   
	   [2304,13243, west,"87 - Flugschule",true], //
	   [2706,12336, west,"85 - Funkturm Whiskey",true], // 
	   [1774,11999, west,"88 - Manus Pizzaria",true], // 
	   
	   [2191,11213, west,"116 - oppas cassino",true], //
	   [3074,11092, west,"89 - Belford Bank",true] // 
];

GVARMAIN(csat_flags_pos) = [

//Basis 

	   
	   [4060,11760, east,"118 - neue nato bruecke",true], // 
	   [3733,12346, east,"59 - Battery Müller 2",true], //
	   [2938,13086, east,"86 - GSM Station",true], // 
	   
	   [4015,13570, east,"27 - Panzerteststrecke",true], // 
	   [3973,13840, east,"19 - alter Militaerkomplex",true] // 
];


// erzeuge für alle oben gelisteten Positionen einen Flaggenmast mit korrekter Flagge vom Server aus.

if (isServer) then 
{
	{
		_x params ["_x", "_y", "_owner", "_name", "_aktiv"];
		
		if (_aktiv) then
		{
			// Objekt erzeugen
			private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
			_flag setVariable ["opt_flag", true, true];

			if (OPT_sectorcontrol_flagStartNeutral) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
			{
				_flag setVariable ["owner", sideUnknown, true];
			}
			else
			{
				_flag setFlagTexture "\A3\Data_F\Flags\Flag_NATO_CO.paa";
				_flag setVariable ["owner", _owner, true];
			};
		};
		
	} forEach GVARMAIN(nato_flags_pos);

	{
		_x params ["_x", "_y", "_owner", "_name", "_aktiv"];
		
		if (_aktiv) then
		{
			// Objekt erzeugen
			private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
			_flag setVariable ["opt_flag", true, true];

			if (OPT_sectorcontrol_flagStartNeutral) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
			{
				_flag setVariable ["owner", sideUnknown, true];
			}
			else
			{
				_flag setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
				_flag setVariable ["owner", _owner, true];
			};
		};
	} forEach GVARMAIN(csat_flags_pos);
};
