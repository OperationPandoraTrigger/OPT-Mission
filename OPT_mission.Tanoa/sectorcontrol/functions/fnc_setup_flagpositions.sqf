/*
Diese Datei enthält alle Flaggenpositionen aufgeteilt in NATO und CSAT.
Jede Flagge besitzt Koordinaten (x,y) sowie die owner Seite, die im Besitz der Flagge ist.
Demnach muss nach jeder Schlacht nur der owner angepasst werden.
west -> Angriffsziel für CSAT
east -> Angriffsziel für NATO
*/
#include "script_component.hpp"

GVARMAIN(nato_flags_pos) = [
	[12233,9061, west,"000 - Checkpoint Alpha",true],
	[11088,11494, west,"003/2 - Radar Bravo",true],
	[11195,9753, west,"077 - Vagal Minen AG",true]  
];

GVARMAIN(csat_flags_pos) = [
	[11926,8702, east,"003 - Checkpoint Charlie",true],
	[9664,9882, east,"007 - Checkpoint Vaglala Road",true],
	[10382,8529, east,"062 - Kreuzung",true]
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
				_flag setFlagTexture "bilder\arf_fahne.paa";
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
				_flag setFlagTexture "bilder\sword_fahne.paa";
				_flag setVariable ["owner", _owner, true];
			};
		};
	} forEach GVARMAIN(csat_flags_pos);
};
