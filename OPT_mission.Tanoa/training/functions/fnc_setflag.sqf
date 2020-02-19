/**
* Author: James
* set selected flag to new position specified in opt_flagDialog
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_setFlag.sqf;
*
*/
#include "script_component.hpp"

#define FLAG_IDC 1400

disableSerialization;

private _dialog = uiNamespace getVariable [QGVAR(flagDialog) , displayNull];
if (_dialog isEqualTo displayNull) exitWith {};

private _edit = _dialog displayCtrl FLAG_IDC;

private _lineBreak = toString [10];
private _dialogText = "";

_dialogText = ctrlText FLAG_IDC;

private _obj = nearestObjects [position player, ["FlagPole_F"], 100];
if (count _obj == 0) exitWith {};

private _flagList = [];
{
    // skip all flags that are not opt flags
    if (_x getVariable ["opt_flag", false]) then
    {
		_flagList pushBack _x;
    };
} forEach _obj;

if (count _flagList != count (_dialogText splitString _lineBreak)) exitWith {systemChat format ["Anzahl der Flaggen stimmt nicht überein: Nähe: %1 / Liste: %2", count _flagList, count (_dialogText splitString _lineBreak)];};

{
	// string -> positionsarray
	_arr = _x splitString "[,]";
	_pos = [];
	_pos pushBack (parseNumber (_arr select 0));
	_pos pushBack (parseNumber (_arr select 1));
	_pos pushBack 0;

	private _flagge = _flagList select _forEachIndex;

	// flaggenmarker verschieben
	_marker = _flagge getVariable "OPT_sectorcontrol_flagMarker";
    _marker setMarkerPos _pos;

	// minenzonenmarker verschieben
	_marker = _flagge getVariable "OPT_sectorcontrol_mineMarker";
    _marker setMarkerPos _pos;

	// flagge verschieben
	_flagge setPos _pos;
} foreach (_dialogText splitString _lineBreak);
