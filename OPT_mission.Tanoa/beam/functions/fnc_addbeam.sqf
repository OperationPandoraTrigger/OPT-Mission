/**
* Author: form
* update beam positions
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_addBeam.sqf;
*
*/
#include "script_component.hpp"

#define ADDBEAM_IDC 1413

disableSerialization;

private _dialog = uiNamespace getVariable [QGVAR(AddBeamDialog) , displayNull];
if (_dialog isEqualTo displayNull) exitWith {};

private _edit = _dialog displayCtrl ADDBEAM_IDC;

private _lineBreak = toString [10];
private _dialogText = ctrlText ADDBEAM_IDC;

// parse dialogtext to array
private _orte = [];
{
	_orte pushBack parseSimpleArray _x;

} foreach (_dialogText splitString _lineBreak);

// write updated positions back to global variables
if (PLAYER_SIDE == east) then
{
    GVAR(locations_east) = _orte;
	publicVariable QGVAR(locations_east);
}
else
{
    GVAR(locations_west) = _orte;
	publicVariable QGVAR(locations_west);
};
