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

disableSerialization;

private _dialog = uiNamespace getVariable [QGVAR(AddBeamDialog) , displayNull];
if (_dialog isEqualTo displayNull) exitWith {ERROR_MSG("Fehler beim Aufruf von AddBeamDialog!")};

// Waffenruhe bei Buttonklick schon abgelaufen?
if (GVARMAIN(missionStarted)) exitWith
{
	private _txt = format["Die Waffenruhe war bereits abgelaufen!"];
	["Beam", _txt, "red"] remoteExecCall [QEFUNC(gui,message), player, false];
	closeDialog 0;
};

private _edit = _dialog displayCtrl DIALOG_ADDBEAM_IDC;

private _lineBreak = toString [10];
private _dialogText = ctrlText DIALOG_ADDBEAM_IDC;

// parse dialogtext to array
private _orte = [];
{
	_orte pushBackUnique parseSimpleArray _x;

} foreach (_dialogText splitString _lineBreak);

// Prüfung auf erlaubte Anzahl der Beampunkte (Definiert in beam\setup.hpp)
if (count _orte <= BEAM_MAX_LOCATIONS) then
{
	// write updated positions back to global variables
	if (PLAYER_SIDE == east) then
	{
		GVAR(custom_beam_east) = _orte;
		publicVariable QGVAR(custom_beam_east);
	}
	else
	{
		GVAR(custom_beam_west) = _orte;
		publicVariable QGVAR(custom_beam_west);
	};

	// Log beam position update
	private _message = format
	[
		"%1 (%2) legt %3 Beampunkt(e) fest: %4",
		PLAYER_NAME, 
		PLAYER_SIDE,
		count _orte,
		_orte
	];
	["Beam", _message] remoteExecCall [QEFUNC(log,write), 2, false];
}
else
{
	private _txt = format["Es dürfen nur %1 Beampunkte angegeben werden!", BEAM_MAX_LOCATIONS];
	["Beam", _txt, "red"] remoteExecCall [QEFUNC(gui,message), player, false];
};

closeDialog 0;
