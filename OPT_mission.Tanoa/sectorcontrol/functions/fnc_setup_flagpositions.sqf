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


	   [5027,11455, west,"41 - Lands End",true], //
	   [6040,10417, west,"57 - Sender GT",true], // 
	   [7030,10802, west,"49 - Hbf. Hulabula",true] // 
	   
    

];

GVARMAIN(csat_flags_pos) = [

//Basis 

	   [5706,10317, east,"56 - GT Fischmarkt",true], // 
	   [6340,9961, east,"120 - GT Oberstadt",true], //
	   [7036,9698, east,"15 - Opfertempel",true] // 
	   

	   
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
