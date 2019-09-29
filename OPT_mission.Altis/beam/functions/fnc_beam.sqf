/**
* Description:
* Teleport player and their vehicle to selected destination.
* Check for truce time and level of teleport location.
*
* Author:
* James
*
* Edit by:
* Manu
*
* Arguments:
* 0: <NUMBER> current selected index of listbox control
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* no - should be called from beam dialog
*
* Global:
* no
*
* Sideeffects:
* black out and black in effect for player
* local gui messages for player
* log message "%1 (%2) wurde nach %3 gebeamt"
*
* Example:
* [0] spawn EFUNC(beam,beam);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
   ["_ix", -1, [0], 1]
];

/* VALIDATION */
if (_ix == -1) exitWith {};

/* CODE BODY */
private _beamingAllowed = true;
private _beamingRestrictedVehicle = false;
private _isBeamDuringMissionForbidden = true;
private _arry = GVAR(box) select _ix;
private _beamLevel = _arry select 2;
private _beamPosition = _arry select 0;


if (vehicle player != player) then 
{
    /* checks if player`s vehicle is listed as restricted vehicle in fnc_setup_beamorte.sqf */
    if ((typeOf vehicle player) in GVAR(restricted_vehicles)) then 
    {
        _beamingRestrictedVehicle = true;
    };

    /* checks if player`s vehicle is listed as beam vehicle in fnc_setup_beamorte.sqf */
    if ((typeOf vehicle player) in GVAR(beam_vehicles)) then
    {
    	_isBeamDuringMissionForbidden = false;
    };

    /* denies beaming if beaming position`s level is not cleared for restricted vehicles */
    if (_beamLevel != 3 and _beamingRestrictedVehicle) then
    { 
        _beamingAllowed = false;

        ["Beamsystem", "Der gewählte Ort ist nicht für schwere Fahrzeuge freigegeben!", "red"] call EFUNC(gui,message);
    };

    /* denies beaming if beaming position`s level is not cleared for any vehicles */
    if (_beamLevel < 2) then
    { 
        _beamingAllowed = false;

        ["Beamsystem", "Der gewählte Ort ist nicht für Fahrzeuge freigegeben!", "red"] call EFUNC(gui,message);
    };
    
    /* blocks usage of non-beam vehicles for beampoints with _beamLevel == 4 */
    if (_isBeamDuringMissionForbidden and _beamLevel == 4 and (!GVARMAIN(missionStarted)) ) then
    {
        _beamingAllowed = false;
	
	["Beamsystem", "Das System steht nur für freigegebene Beamfahrzeuge zur Verfügung!", "red"] call EFUNC(gui,message);
    };
};


if (GVARMAIN(missionStarted)) then 
{
    /* prevents beaming to beampoints with level != 4 after mission start (eg. if dialog was opened before start) */
    if (_beamLevel < 4) then 
    {
        _beamingAllowed = false;

        ["Beamsystem", "Dieser Beampunkt steht nur während der Waffenruhe zur Verfügung!", "red"] call EFUNC(gui,message);
    };
    /* blocks beaming after mission start for vehicles not listed in GVAR(beam_vehicles) */
    if (_isBeamDuringMissionForbidden and (vehicle player != player)) then
    {
        _beamingAllowed = false;
	
	    ["Beamsystem", "Das System steht nur noch für freigegebene Beamfahrzeuge zur Verfügung!", "red"] call EFUNC(gui,message);
    };
};


/* initiates beaming process if all previous checks are passed ( _beamingAllowed == true )*/
if (_beamingAllowed) then 
{ 
    /* black fade out */
    (QGVAR(rsc_layer) call BIS_fnc_rscLayer) cutText ["Teleport...", "BLACK OUT", 3];

    // beam vehicle and player
    // mission sqm format of x,z,y...
    private _xPos = _beamPosition select 0;
    private _yPos = _beamPosition select 2;

    /* creates invisible pad for safer beaming */
    private _tempLogic = "Land_HelipadEmpty_F" createVehicle 
    [
        (_xPos) - 10 * sin(random 360), 
        (_yPos) - 10 * cos(random 360)
    ]; 
    sleep 1;

    /* teleports player or vehicle on the invisible pad */
    (vehicle player) setPos getPos _tempLogic;

    /* deletes the invisible pad again */
    deleteVehicle _tempLogic;

    /* removal of the black fade out */
    (QGVAR(rsc_layer) call BIS_fnc_rscLayer) cutText ["", "BLACK IN", 3]; // return to game

    private _message = format
    [
        "%1 (%2) wurde nach %3 gebeamt",
        PLAYER_NAME, 
        PLAYER_SIDE,
        _arry select 1
    ];
    ["Beam", _message] remoteExecCall [QEFUNC(log,write), 2, false];
};

closeDialog 0;
