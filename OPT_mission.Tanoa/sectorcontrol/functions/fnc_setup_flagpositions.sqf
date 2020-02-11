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


	   [10534,10576, west,"37 - Imone",true], //
	   [11803,10192, west,"001 - Tagebau Werkhalle",true], // 
	   [11072,9852, west,"75 - Vagalala Hotel",true], // 
	   
	   [11195,9753, west,"77 - vag Minen",true], //
	   [12053,9700, west,"112 - Schlafmoon Plantage",true], // 
	   [12233,9061, west,"000 - Checkpoint Alpha",true] // 
    

];

GVARMAIN(csat_flags_pos) = [

//Basis 

	   [10280,10337, east,"117 - Certains Hanfplantage",true], // 
	   [9664,9882, east,"007 - Checkpoint Vagalalaroad",true], //
	   [10919,9826, east,"76 - Alte Feuerwache",true], // 
	   
	   [11086,9583, east,"78 - Vagalala ZRG",true], // 
	   [11926,8702, east,"003 - Checkpoint Charlie",true], // 
	   [10382,8529, east,"062 - Kreutzzug",true], // 
	   [10670,8706, east,"123 - Radio Chidon",true], // 
	   [11056,8426, east,"030 - Schatztempel",true] // 

	   
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
