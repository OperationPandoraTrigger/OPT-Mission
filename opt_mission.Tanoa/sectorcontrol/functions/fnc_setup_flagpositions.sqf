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
	   
	   [12169,8192, west,"-000 - Frozens Trinkhalle",true], //
	   [12053, 9700, west,"2 - Vagalala Schlafmoon-Plantage",false], // 2 - Vagalala Schlafmoon-Plantage
	   [24770, 19122, west,"59 - Almyra North",false], // 59 - Almyra North
	   
	   [26746, 24660, west,"60 - Molos Airbase",false], // 60 - Molos Airbase
	   [26958, 23200, west,"61 - Molos Town",false], // 61 - Molos Town
	   [25440, 20346, west,"62 - Refinery",false] // 62 - Refinery
];

GVARMAIN(csat_flags_pos) = [

//Basis 

	   
	   [12239, 9051, east,"000 - Checkpoint Alpha",true], // 000 - Checkpoint Alpha
	   [13763, 10808, east,"4 - Checkpoint Bravo",false], //
	   [24770, 19122, east,"59 - Almyra North",false], // 59 - Almyra North
	   
	   [26746, 24660, east,"60 - Molos Airbase",false], // 60 - Molos Airbase
	   [26958, 23200, east,"61 - Molos Town",false], // 61 - Molos Town
	   [25440, 20346, east,"62 - Refinery",false] // 62 - Refinery
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
			_flag setFlagTexture "\A3\Data_F\Flags\Flag_NATO_CO.paa";

			// notwendige Variablen fuer OPT
			_flag setVariable ["owner", _owner, true];        
			_flag setVariable ["opt_flag", true, true];
		};	
		
	} forEach GVARMAIN(nato_flags_pos);

	{
		_x params ["_x", "_y", "_owner", "_name", "_aktiv"];
		
		if (_aktiv) then
		{
			// Objekt erzeugen
			private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
			_flag setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";

			// notwendige Variablen fuer OPT
			_flag setVariable ["owner", _owner, true];
			_flag setVariable ["opt_flag", true, true];
		};
	} forEach GVARMAIN(csat_flags_pos);
};
