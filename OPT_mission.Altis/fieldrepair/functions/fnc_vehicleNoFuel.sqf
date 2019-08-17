/**
* Author: Senshi
* determine if vehicle has not enough fuel
*
* Arguments:
* 0: <OBJECT> vehicle
*
* Return Value:
* 0: <BOOL> true: vehicle is empty, false: not empty enough
*
* Example:
* [vehicle] call fnc_vehicleNoFuel.sqf;
*
*/
#include "script_component.hpp"

params [["_veh", objNull]];

if (_veh isEqualTo objNull) exitWith {false};

private _flag = false;

// 10% Fuel is the threshold
if (fuel _veh <= 0.1) then {
	_flag = true;
};

_flag