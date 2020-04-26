/**
* Author: form
* initialize addBeam dialog with coordinates of actual beam positions
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initAddBeamDialog.sqf;
*
*/
#include "script_component.hpp"

params [["_dialog", displayNull, [displayNull], 1]];

disableSerialization;

if (_dialog isEqualTo displayNull) exitWith {ERROR_MSG("Fehler beim Aufruf von fnc_initAddBeamDialog!")};

uiNamespace setVariable [QGVAR(AddBeamDialog), _dialog];

private _edit = _dialog displayCtrl DIALOG_ADDBEAM_IDC;

private _lineBreak = toString [10];
private _dialogText = "";

private _orte = [];

if (PLAYER_SIDE == east) then
{
    _orte = GVAR(custom_beam_east);
}
else
{
    _orte = GVAR(custom_beam_west);
};

// write positions to edit-ctrl
{
	_dialogText = format ["%1%2%3", _dialogText, _x, _lineBreak];
} forEach _orte;

_edit ctrlSetText _dialogText;
