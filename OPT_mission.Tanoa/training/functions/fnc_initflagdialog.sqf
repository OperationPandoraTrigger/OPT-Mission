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
* [] call fnc_initFlagDialog.sqf;
*
*/
#include "script_component.hpp"

#define FLAG_IDC 1400

params [["_dialog", displayNull, [displayNull], 1]];

disableSerialization;

if (_dialog isEqualTo displayNull) exitWith {};
uiNamespace setVariable [QGVAR(flagDialog), _dialog];

private _edit = _dialog displayCtrl FLAG_IDC;

// display coordinates of flagpoles nearby

private _lineBreak = toString [10];
private _dialogText = "";

private _obj = nearestObjects [position player, ["FlagPole_F"], 100];
if (count _obj == 0) exitWith {};

private _flagList =[];
{
    // skip all flags that are not opt flags
    if (_x getVariable ["opt_flag", false]) then
    {
        _flagList pushBack _x;
    };
} forEach _obj;

// limit to 5 flags
if (count _flagList > 5) then {_flagList = _flagList select [0,5];};

// write positions to edit-ctrl
{
    _dialogText = format ["%1%2%3", _dialogText, (getPos _x) select [0,2], _lineBreak];
} forEach _flagList;

_edit ctrlSetText _dialogText;
