/**
* Author: James
* condition for addaction entry to capture the flag
*
* Arguments:
* 0: <OBJECT> flag
* 1: <OBJECT> unit 
*
* Return Value:
* 0: <BOOl> true - flag can be captured, false - otherwise
*
* Example:
* [flag, player] call opt_sectorcontrol_fnc_captureFlagCondition.sqf;
*
* Server only:
* no
*
* Public:
* yes
*/
#include "script_component.hpp"

/* PARAMS */
params [
   ["_flag", objNull, [objNull], 1],
   ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
if (_flag isEqualTo objNull or _unit isEqualTo objNull) exitWith{false};

/* CODE BODY */
// Flagge kann nur nach Missionsstart, in 5 m Radius, 
// ausserhalb eines Fahrzeugs 
// in Restspielzeit gezogen werden 
// nur von der anderen Seite
vehicle _unit == _unit and
GVARMAIN(missionStarted) and
OPT_PARAM_PLAYTIME - (serverTime - EGVAR(mission,startTime)) > 0 and
(UNIT_SIDE(_unit) != _flag getVariable ['owner', sideUnknown])