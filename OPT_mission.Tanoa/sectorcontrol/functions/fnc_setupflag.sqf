/**
* Author: James
* initialize all flag poles with optionall marker and add action menu for playersNumber
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_setupFlag.sqf;
*
*/
#include "script_component.hpp"

/* BY JAMES */
// Variablen opt_csat_flags und opt_nato_flags werden durch die HL & PL von NATO und CSAT in der Warmup-Phase am Kartenboard ausgewaehlt
// siehe mission\functions\fnc_chooseFlag für Details

// fallback if no flag was chosen -> random war!
while {count GVARMAIN(nato_flags) < round OPT_sectorcontrol_flagCountNATO} do
{
    GVARMAIN(nato_flags) pushBackUnique [selectRandom (allMissionObjects "FlagPole_F" select {(_x getVariable "owner" == west) || (_x getVariable "owner" == sideUnknown)})];
};
publicVariable QGVARMAIN(nato_flags);

while {count GVARMAIN(csat_flags) < round OPT_sectorcontrol_flagCountCSAT} do
{
    GVARMAIN(csat_flags) pushBackUnique [selectRandom (allMissionObjects "FlagPole_F" select {(_x getVariable "owner" == east) || (_x getVariable "owner" == sideUnknown)})];
};
publicVariable QGVARMAIN(csat_flags);

// Delete all Flagmarkers set during Waffenruhe
remoteExecCall [QFUNC(deleteMarkers)];

/*
Fuer jede Flagge in einem Sektor: 
Marker für Flag falls Marker an
Marker für Minensperre falls Minensperre an
unverwundbar, Logistik-Script aus sowie Actionmeneintrag fuer Spieler
*/
{
    private _flag = _x select 0;

    // erzeuge fuer jede gefundene Flagge einen Marker auf der Karte
    if (GVAR(flagMarkerOn)) then {
        private _markerName = str _flag;
        private _marker = createMarker [_markerName, getPos _flag];

        if (GVARMAIN(csat_flags) find _x >= 0) then {
            _marker setMarkerType "flag_CSAT";
        } else {
            _marker setMarkerType "flag_NATO";
        };
        _flag setVariable [QGVAR(flagMarker), _marker, true];
    };

    // mark free mine zone around flag
    if (GVAR(flagFreeMineZoneMarkerOn)) then {
        private _markerName = (str _flag) + "_free_mine_zone";
        private _marker = createMarker [_markerName, getPos _flag];
        _marker setMarkerShape "ELLIPSE";
        _marker setMarkerBrush "Solid";
        _marker setMarkerColor "ColorRed";
        _marker setMarkerAlpha 0.5;
        _marker setMarkerSize [GVAR(flagFreeMineZoneRadius), GVAR(flagFreeMineZoneRadius)];
        _flag setVariable [QGVAR(mineMarker), _marker, true];
    };
    
    [
        _flag,
        [
            SECTORCONTROL_ACTION_FLAG call XRedText,     // Anzeigetext
            {[_this select 0, _this select 1] call FUNC(captureFlag);},  // Skript
            [],                                                          // Parameter fr Skript
            999,                                                         // priority
            true,                                                        // showWindow
            true,                                                        // hideOnUse 
            "",                                                          // shortcut
            SECTORCONTROL_FLAG_CONDITION,                                // condition
            GVAR(flagDistanceToPlayer)                                   // radius
        ]
    ] remoteExecCall ["addAction", 0, true];
   
    _flag allowDamage false;  // Flagge kann nicht beschaedigt werden
} foreach (GVARMAIN(csat_flags) + GVARMAIN(nato_flags));
