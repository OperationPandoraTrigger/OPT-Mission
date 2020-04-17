/**
* Author: James
* heal player up to 25%
*
* Arguments:
* 0: <OBJECT> unit that called the action
*
* Return Value:
* None
*
* Example:
* [player] call fnc_handleFirstAid.sqf;
*
*/
#include "script_component.hpp"

params ["_target", "_caller"];

if (_caller getVariable ["FAR_isUnconscious", 0] == 1) exitWith {};

_caller selectWeapon primaryWeapon _caller;
sleep 1;
_caller playAction "medicStart"; // endless loop until we call "medicStop"

[_caller, _caller] call FUNC(medicEquipment);

sleep 5;

_target setDammage (0);

_target setVariable ["FAR_firstAidMultiplicator", 0, true];

_caller playAction "medicStop";

[] call FUNC(clearGarbage);

true