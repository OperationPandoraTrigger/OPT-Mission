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

private _edit = _dialog displayCtrl MYPOS_IDC;

// display coordinates of flagpoles nearby

private _lineBreak = toString [10];
private _dialogText = "";

// get location string from something nearby
private _location = "";
{ 
	scopeName "locationsearch";
	if (text _x != "") then
	{
		_location = text _x;
		breakOut "locationsearch";
	};
} forEach nearestLocations [player, ["Airport", "Area", "BorderCrossing", "CityCenter", "CivilDefense", "CulturalProperty", "DangerousForces", "Flag", "FlatArea", "FlatAreaCity", "FlatAreaCitySmall", "Hill", "HistoricalSite", "Invisible", "Mount", "Name", "NameCity", "NameCityCapital", "NameLocal", "NameMarine", "NameVillage", "RockArea", "SafetyZone", "Strategic", "StrongpointArea", "VegetationBroadleaf", "VegetationFir", "VegetationPalm", "VegetationVineyard", "ViewPoint", "b_air", "b_antiair", "b_armor", "b_art", "b_hq", "b_inf", "b_installation", "b_maint", "b_mech_inf", "b_med", "b_mortar", "b_motor_inf", "b_naval", "b_plane", "b_recon", "b_service", "b_support", "b_uav", "b_unknown", "c_air", "c_car", "c_plane", "c_ship", "c_unknown", "fakeTown", "group_0", "group_1", "group_10", "group_11", "group_2", "group_3", "group_4", "group_5", "group_6", "group_7", "group_8", "group_9", "n_air", "n_antiair", "n_armor", "n_art", "n_hq", "n_inf", "n_installation", "n_maint", "n_mech_inf", "n_med", "n_mortar", "n_motor_inf", "n_naval", "n_plane", "n_service", "n_support", "n_uav", "n_unknown", "o_air", "o_antiair", "o_armor", "o_art", "o_hq", "o_inf", "o_installation", "o_maint", "o_mech_inf", "o_med", "o_mortar", "o_motor_inf", "o_naval", "o_plane", "o_recon", "o_service", "o_support", "o_uav", "o_unknown", "respawn_air", "respawn_armor", "respawn_inf", "respawn_motor", "respawn_naval", "respawn_para", "respawn_plane", "respawn_unknown", "u_installation"], 5000];

// write position to edit-ctrl
_dialogText = format ["%1%2%3", _dialogText, [[(getPos player) select 0, 0, (getPos player) select 1], _location, 4], _lineBreak];

_edit ctrlSetText _dialogText;
