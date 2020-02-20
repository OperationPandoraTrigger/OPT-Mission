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


	   [8808,7329, west,"33 - Old but Gold",true], //
	   [10217,5040, west,"113 - Lösi",true], // 
	   [9005,4668, west,"53 - La Foa",true] // 
	   
    

];

GVARMAIN(csat_flags_pos) = [

//Basis 

	   [9243,7560, east,"63 - Holzlager",true], // 
	   [9981,6741, east,"83 - alte Festung",true], //
	   [11153,5101, east,"90 - Harcourt Zollamt",true] // 
	   

	   
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
			_flag setFlagTexture "bilder\sword_fahne.paa";

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
			_flag setFlagTexture "bilder\arf_fahne.paa";

			// notwendige Variablen fuer OPT
			_flag setVariable ["owner", _owner, true];
			_flag setVariable ["opt_flag", true, true];
		};
	} forEach GVARMAIN(csat_flags_pos);
};
