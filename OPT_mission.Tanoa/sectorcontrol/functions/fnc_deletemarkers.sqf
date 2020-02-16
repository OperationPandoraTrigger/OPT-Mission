/**
* Author: form
* Deletes all flag pole position markers which were set by HL or PL during Waffenruhe.
* Is called via fnc_setupFlag.sqf on mission start.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* remoteExecCall [QFUNC(deleteMarkers)];
*
*/
#include "script_component.hpp"

{
	if (getMarkerType _x isEqualTo "selector_selectedMission") then
	{
		deleteMarkerLocal _x;
	};
} forEach allMapMarkers;
