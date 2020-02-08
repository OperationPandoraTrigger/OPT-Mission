#include "script_component.hpp"

openMap [true, false];

 // instructions for player
_txt = "Alle möglichen Angriffsflaggen sind mit einem schwarzen Kreis markiert.";
["Instruktionen", _txt, "blue"] call EFUNC(gui,message);
_txt = "Die gewählte Flagge wird je nach Seite blau oder rot hervorgehoben.<br/>Es kann beliebig oft neu gewählt werden.<br/>";
["Instruktionen", _txt, "blue"] call EFUNC(gui,message);

// create local marker for each flag pole
private _flagMarker = [];
{
    // skip all flags that are not opt flags
    if !(_x getVariable ["opt_flag", false]) exitWith {};

    // only show attack flags
    switch (PLAYER_SIDE) do {
        case west: {
            if (_x getVariable ["owner", sideUnknown] == east) then {
                private _markerName = format["marker_attackNATO_%1", _forEachIndex];
                private _marker = createMarkerLocal [_markerName, getPos _x];
                _marker setMarkerTypeLocal "hd_objective";
                _flagMarker pushBack _marker;
            };

            if (_x in GVARMAIN(csat_flags)) then {
                private _markerName = format["marker_active_flag"];
                private _marker = createMarkerLocal [_markerName, getPos _x];
                _marker setMarkerTypeLocal "selector_selectedMission";
                _marker setMarkerSizeLocal [2,2];
                _marker setMarkerColorLocal "ColorBLUFOR";
            };

        };

        case east: {
            if (_x getVariable ["owner", sideUnknown] == west) then {
                private _markerName = format["marker_attackCSAT_%1", _forEachIndex];
                private _marker = createMarkerLocal [_markerName, getPos _x];
                _marker setMarkerTypeLocal "hd_objective";
                _flagMarker pushBack _marker;
            };

            if (_x in GVARMAIN(nato_flags)) then {
                private _markerName = format["marker_active_flag"];
                private _marker = createMarkerLocal [_markerName, getPos _x];
                _marker setMarkerTypeLocal "selector_selectedMission";
                _marker setMarkerSizeLocal [2,2];
                _marker setMarkerColorLocal "ColorOPFOR";
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
        if ((_flag getVariable ["owner", sideUnknown]) == PLAYER_SIDE) exitWith{};

        _markerName = str [_flag];

        switch (PLAYER_SIDE) do
        {
            case west:
            {
                private _index = GVARMAIN(csat_flags) find [_flag];

                // flagge schon aktiv gewesen? -> löschen
                if (_index >= 0) then
                {
                    deleteMarkerLocal str (GVARMAIN(csat_flags) select _index);
                    GVARMAIN(csat_flags) deleteAt _index;
                    publicVariable QGVARMAIN(csat_flags);
                }

                // neue flagge? -> hinzufügen
                else
                { 
                    // noch genügend flaggen erlaubt?
                    if (count GVARMAIN(csat_flags) < round OPT_sectorcontrol_flagCountPerSide) then
                    {
                        private _marker = createMarkerLocal [_markerName, getPos _flag];
                        _marker setMarkerTypeLocal "selector_selectedMission";
                        _marker setMarkerSizeLocal [2,2];
                        _marker setMarkerColorLocal "ColorBLUFOR";
                        GVARMAIN(csat_flags) pushBack [_flag];
                        publicVariable QGVARMAIN(csat_flags);
                    };
                };
            };

            case east:
            {
                private _index = GVARMAIN(nato_flags) find [_flag];

                // flagge schon aktiv gewesen? -> löschen
                if (_index >= 0) then
                {
                    deleteMarkerLocal str (GVARMAIN(nato_flags) select _index);
                    GVARMAIN(nato_flags) deleteAt _index;
                    publicVariable QGVARMAIN(nato_flags);
                }

                // neue flagge? -> hinzufügen
                else
                { 
                    // noch genügend flaggen erlaubt?
                    if (count GVARMAIN(nato_flags) < round OPT_sectorcontrol_flagCountPerSide) then
                    {
                        private _marker = createMarkerLocal [_markerName, getPos _flag];
                        _marker setMarkerTypeLocal "selector_selectedMission";
                        _marker setMarkerSizeLocal [2,2];
                        _marker setMarkerColorLocal "ColorOPFOR";
                        GVARMAIN(nato_flags) pushBack [_flag];
                        publicVariable QGVARMAIN(nato_flags);
                    };
                };
            };
        };

       systemChat format ["%1 von %2 erlaubten Flaggen gewählt.", count GVARMAIN(nato_flags), round OPT_sectorcontrol_flagCountPerSide];
    };
    
}] call BIS_fnc_addStackedEventHandler;

waitUntil {!visibleMap};
["sectorMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

{
    deleteMarker _x;
} forEach _flagMarker;
deleteMarker "marker_active_flag";