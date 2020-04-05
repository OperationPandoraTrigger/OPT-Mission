/**
* Author: James
* initialize flag dialog with coordinates of CSAT and NATO flag positions
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initMyPosDialog.sqf;
*
*/
#include "script_component.hpp"

#define MYPOS_IDC 1412

params [["_dialog", displayNull, [displayNull], 1]];

disableSerialization;

if (_dialog isEqualTo displayNull) exitWith {};
uiNamespace setVariable [QGVAR(flagDialog), _dialog];

private _edit = _dialog displayCtrl MYPOS_IDC;

// display coordinates of flagpoles nearby

private _lineBreak = toString [10];
private _dialogText = "";

// write position to edit-ctrl
_dialogText = format ["%1%2%3", _dialogText, (getPos player) select [0,2], _lineBreak];

_edit ctrlSetText _dialogText;
