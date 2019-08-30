/**
* Author: James
* set fuel for a vehicle to at least 10%
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [vehicle] call fnc_setMinFuel.sqf;
*
*/
#include "script_component.hpp"

params [["_veh", objNull]];

private _fuel = fuel _veh;
if (_fuel < 0.1) then {
    [_veh, _fuel + 0.1] remoteExecCall ["setFuel", _veh, false];
};

true
