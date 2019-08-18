/**
* Author: James
* determine if vehicle is lightly damaged
*
* Arguments:
* 0: <OBJECT> vehicle
*
* Return Value:
* 0: <BOOL> true: vehicle is damaged, false: not damaged
*
* Example:
* [vehicle] call fnc_vehicleDamagedLight.sqf;
*
*/
#include "script_component.hpp"

params [["_veh", objNull]];

if (_veh isEqualTo objNull) exitWith {false};

private _flag = false;

{
	if (_x > 0.01) exitWith {
		_flag = true;
	};
} forEach (getAllHitPointsDamage _veh select 2);

_flag
