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

// Ermittle die erlaubte Anzahl der
// Beampunkte (Definiert in beam\setup.hpp)
// +
// Anzahl der Flaggen, die dem Gegner für den Angriff zur Auswahl stehen. (Definiert in sectorcontrol\functions\fnc_setup_flagpositions.sqf)
private _MAX_LOCATIONS = 0;
if (PLAYER_SIDE == east) then
{
	_MAX_LOCATIONS = BEAM_MAX_LOCATIONS + count GVARMAIN(csat_flags_pos);
}
else
{
	_MAX_LOCATIONS = BEAM_MAX_LOCATIONS + count GVARMAIN(nato_flags_pos);
};

// Prüfung auf erlaubte Anzahl der Beampunkte.
if (count _orte <= _MAX_LOCATIONS) then
{
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
	private _txt = format["Es dürfen nur %1 Beampunkte angegeben werden!", _MAX_LOCATIONS];
	["Beam", _txt, "red"] remoteExecCall [QEFUNC(gui,message), player, false];
};

closeDialog 0;
