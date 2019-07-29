/**
* Author: James
* open map and choose teleport
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_teleport.sqf;
*
*/
#include "script_component.hpp"

["Teleport", "Position zum Teleport mit Linksklick auswÃ¤hlen.", "blue"] call EFUNC(gui,message);
openMap true;

[QGVAR(onMapSingleClick), "onMapSingleClick", {
	/*
	units: Array - leader selected units, same as groupSelectedUnits (same as _units param)
	pos: Array - world Position3D of the click in format [x,y,0] (same as _pos param)
	alt: Boolean - true if Alt key was pressed (same as _alt param)
	shift: Boolean - true if Shift key was pressed (same as _shift param)
	*/

	// in der Nähe des CSAT-Flugzeugträgers angepasste Höhe für den Teleport
	if ((_pos distance2D homeflag_east) < 300) then
	{
		vehicle player setPosASL [(random 100) - 50, (random 100) - 50, 1000 + random 100];
       		vehicle player setVectorUp [0,0,1];
       		vehicle player setPosASL [_pos select 0, _pos select 1, (getPosASL homeflag_east select 2) + 0.2];
	}
	else
	{
		// in der Nähe des NATO-Flugzeugträgers angepasste Höhe für den Teleport
	       	if ((_pos distance2D homeflag_west) < 300) then
	       	{
       			vehicle player setPosASL [(random 100) - 50, (random 100) - 50, 1000 + random 100];
        		vehicle player setVectorUp [0,0,1];
       			vehicle player setPosASL [_pos select 0, _pos select 1, (getPosASL homeflag_west select 2) + 0.2];
       		}
       		else
       		{
			// fliegendes Luftfahrzeug?
			private _height = getPosATL player select 2;
			if ((vehicle player isKindOf "Air") and (_height > 2)) then
			{
				vehicle player setPosATL (_pos vectorAdd [0, 0, 300]);
			}
	        	else
	        	{
		        	// sonst normaler teleport
       				vehicle player setPos _pos;
			};
		};
	};
	[QGVAR(onMapSingleClick), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	openMap false;
}] call BIS_fnc_addStackedEventHandler;
