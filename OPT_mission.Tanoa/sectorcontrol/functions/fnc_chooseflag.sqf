#include "script_component.hpp"

openMap [true, false];

 // instructions for player
_txt = "Alle möglichen Angriffsflaggen sind mit einem schwarzen Kreis markiert.";
["Instruktionen", _txt, "blue"] call EFUNC(gui,message);
_txt = "Die gewählte Flagge wird je nach Seite blau oder rot hervorgehoben.<br/>Es kann beliebig oft neu gewählt werden.<br/>";
["Instruktionen", _txt, "blue"] call EFUNC(gui,message);

// Memory for markers which are deleted on map-close
waffenruheFlagMarkers = [];

// create local marker for each flag pole and restore selected flagmarkers
{
    // only process opt flags
    if (_x getVariable ["opt_flag", false]) then
    {
        // only show attack flags
        switch (PLAYER_SIDE) do {
            case west: {
                // Flaggenpunkte die zur Auswahl stehen
                if (_x getVariable ["start_owner", sideUnknown] == east) then {
                    private _markerName = format["OptionMarkerNATO_%1_%2", _forEachIndex, _x];
                    private _marker = createMarkerLocal [_markerName, getPos _x];
                    _marker setMarkerTypeLocal "hd_objective";
                    waffenruheFlagMarkers pushBackUnique _marker;
                };

                // Gewählte Ziele
                if (_x in GVARMAIN(csat_flags)) then {
                    private _markerName = format["ActiveMarkerNATO_%1", _x];
                    private _marker = createMarkerLocal [_markerName, getPos _x];
                    _marker setMarkerTypeLocal "selector_selectedMission";
                    _marker setMarkerSizeLocal [2,2];
                    _marker setMarkerColorLocal "ColorBLUFOR";
                    waffenruheFlagMarkers pushBackUnique _marker;
                };
            };

            case east: {
                // Flaggenpunkte die zur Auswahl stehen
                if (_x getVariable ["start_owner", sideUnknown] == west) then {
                    private _markerName = format["OptionMarkerCSAT_%1_%2", _forEachIndex, _x];
                    private _marker = createMarkerLocal [_markerName, getPos _x];
                    _marker setMarkerTypeLocal "hd_objective";
                    waffenruheFlagMarkers pushBackUnique _marker;
                };

                // Gewählte Ziele
                if (_x in GVARMAIN(nato_flags)) then {
                    private _markerName = format["ActiveMarkerCSAT_%1", _x];
                    private _marker = createMarkerLocal [_markerName, getPos _x];
                    _marker setMarkerTypeLocal "selector_selectedMission";
                    _marker setMarkerSizeLocal [2,2];
                    _marker setMarkerColorLocal "ColorOPFOR";
                    waffenruheFlagMarkers pushBackUnique _marker;
                };
            };
        };
    };
} forEach allMissionObjects "FlagPole_F";

// add EH for mouse action
/* _this ([<units>,<pos>,<alt>,<shift>]) and in special variables _units, _pos, _alt, _shift */
["sectorMap", "onMapSingleClick", {
    private _flag = nearestObjects [_pos, ["FlagPole_F"], 100];

    if (count _flag > 0) then {
        _flag = _flag select 0;

        // bugfix if enemy flag was chosen
        if ((_flag getVariable ["start_owner", sideUnknown]) == PLAYER_SIDE) exitWith{};

        switch (PLAYER_SIDE) do
        {
            case west:
            {
                private _index = GVARMAIN(csat_flags) find _flag;

                // flagge schon aktiv gewesen? -> löschen
                if (_index >= 0) then
                {
                    allMapMarkers apply
                    {
	                    if (getMarkerType _x isEqualTo "selector_selectedMission" and _flag distance2D getMarkerPos _x < 1) then
	                    {
		                    deleteMarkerLocal _x;
	                    };
                    };
                    GVARMAIN(csat_flags) deleteAt _index;
                    publicVariable QGVARMAIN(csat_flags);
                    waffenruheFlagMarkers deleteAt (waffenruheFlagMarkers find _flag);
                }

                // neue flagge? -> hinzufügen
                else
                { 
                    // noch genügend flaggen erlaubt?
                    if (count GVARMAIN(csat_flags) < round OPT_sectorcontrol_flagCountCSAT) then
                    {
                        private _markerName = format["ActiveMarker_%1", _flag];
                        private _marker = createMarkerLocal [_markerName, getPos _flag];
                        waffenruheFlagMarkers pushBackUnique _marker;
                        _marker setMarkerTypeLocal "selector_selectedMission";
                        _marker setMarkerSizeLocal [2,2];
                        _marker setMarkerColorLocal "ColorBLUFOR";
                        GVARMAIN(csat_flags) pushBack _flag;
                        publicVariable QGVARMAIN(csat_flags);
                    };
                };
                systemChat format ["%1 von %2 erlaubten Flaggen gewählt.", count GVARMAIN(csat_flags), round OPT_sectorcontrol_flagCountCSAT];
            };

            case east:
            {
                private _index = GVARMAIN(nato_flags) find _flag;

                // flagge schon aktiv gewesen? -> löschen
                if (_index >= 0) then
                {
                    allMapMarkers apply
                    {
	                    if (getMarkerType _x isEqualTo "selector_selectedMission" and _flag distance2D getMarkerPos _x < 1) then
	                    {
		                    deleteMarkerLocal _x;
	                    };
                    };
                    GVARMAIN(nato_flags) deleteAt _index;
                    publicVariable QGVARMAIN(nato_flags);
                    waffenruheFlagMarkers deleteAt (waffenruheFlagMarkers find _flag);
                }

                // neue flagge? -> hinzufügen
                else
                { 
                    // noch genügend flaggen erlaubt?
                    if (count GVARMAIN(nato_flags) < round OPT_sectorcontrol_flagCountNATO) then
                    {
                        private _markerName = format["ActiveMarker_%1", _flag];
                        private _marker = createMarkerLocal [_markerName, getPos _flag];
                        waffenruheFlagMarkers pushBackUnique _marker;
                        _marker setMarkerTypeLocal "selector_selectedMission";
                        _marker setMarkerSizeLocal [2,2];
                        _marker setMarkerColorLocal "ColorOPFOR";
                        GVARMAIN(nato_flags) pushBack _flag;
                        publicVariable QGVARMAIN(nato_flags);
                    };
                };
                systemChat format ["%1 von %2 erlaubten Flaggen gewählt.", count GVARMAIN(nato_flags), round OPT_sectorcontrol_flagCountNATO];
            };
        };
    };
}] call BIS_fnc_addStackedEventHandler;

waitUntil {!visibleMap};
["sectorMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

// Alle Marker beim Schließen der Karte entfernen und Array löschen
waffenruheFlagMarkers apply { deleteMarkerLocal _x; };
waffenruheFlagMarkers = nil;
