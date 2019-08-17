/**
* Author: Senshi
* Return how many repairs are left
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

["Feldreparatur", format[STR_REPAIRS_LEFT, _veh getVariable QGVAR(repair_cargo), DEFAULT_REPAIR_TRUCK_USES], "yellow"] call EFUNC(gui,message);