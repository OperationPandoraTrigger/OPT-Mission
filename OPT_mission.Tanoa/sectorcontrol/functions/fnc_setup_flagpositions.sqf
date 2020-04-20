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


	   [14352,8600, west,"69 - schöne Aussicht",true], //
	   [13482,9579, west,"115 - Goldgrube",true], // 
	   [13964,10011, west,"84 - alte Mine",true] // 
	   
    

];

GVARMAIN(csat_flags_pos) = [

//Basis 

	   [13049,10656, east,"04 - Dogana Bluepearl",true], // 
	   [13763,10808, east,"05 - Checkpoint Bravo",true], //
	   [13427,11714, east,"73 - Bluepearl Brecheranlage",true], // 
	   [13784,11900, east,"71 - Trockendock",true] // 


	   
];

// Arrays öffentlich machen - Wichtig für fnc_addbeam
publicVariable QGVARMAIN(nato_flags_pos);
publicVariable QGVARMAIN(csat_flags_pos);

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
			_flag setVariable ["start_owner", _owner, true];

			if (OPT_sectorcontrol_flagStartNeutral) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
			{
				_flag setVariable ["owner", sideUnknown, true];
			}
			else
			{
				_flag setFlagTexture "bilder\sword_fahne.paa";
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
			_flag setVariable ["start_owner", _owner, true];

			if (OPT_sectorcontrol_flagStartNeutral) then // Nur Fahnenmast ohne Flagge zum Start gewünscht?
			{
				_flag setVariable ["owner", sideUnknown, true];
			}
			else
			{
				_flag setFlagTexture "bilder\arf_fahne.paa";
				_flag setVariable ["owner", _owner, true];
			};
		};
	} forEach GVARMAIN(csat_flags_pos);
};
