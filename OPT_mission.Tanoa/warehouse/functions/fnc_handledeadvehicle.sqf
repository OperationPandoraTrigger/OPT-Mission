/**
* Author: James
* log destroyed vehicle with detailed information
*
* Arguments:
* 0: <OBJECT> - Object the event handler is assigned to
* 1: <OBJECT> - Object that killed the unit. Contains the unit itself in case of collisions
* 2: <OBJECT> - Person who pulled the trigger
* 3: <BOOL> - same as useEffects in setDamage alt syntax
*
* Return Value:
* None
*
* Example:
* [car, killer, instigator] call fnc_handleDeadVehicle.sqf;
*
*/
#include "script_component.hpp"

// TODO: rewrite into killed and damagged EH so we have the source parameter available
params [
    ["_vec", objNull, [objNull], 1],
    ["_source", objNull, [objNull], 1],
    ["_instigator", objNull, [objNull], 1],
    "_useEffects"
];

// log destroyed vehicle and killer
[_vec, _instigator, _source] call EFUNC(log,writeKill);


// delete all wrecks within the base safezone
if (!(_vec isKindOf "CAManBase") and ((_vec distance2D (getmarkerPos "respawn_west") < 200) or (_vec distance2D (getmarkerPos "respawn_east") < 200))) then {
    [_vec] spawn {
        params ["_vec"];
        sleep 5;
        deleteVehicle _vec;

        // message only for those within a 200m radius
        _name = getText(configFile >> "CfgVehicles" >> typeOf _vec >> "displayName");
        _txt = format["Es gab einen Unfall in der Basis.<br/> Das Wrack von %1 wurde entsorgt.", _name];
        ["Unfall", _txt, "red"] remoteExecCall [QEFUNC(gui,message), playableUnits select {_x distance _vec < 200}, false];
    };
};

// delete all wrecks within the bridges zone

private _triggerUnits = 
			  (list opt_garbage_collector_bridges_1)
			+ (list opt_garbage_collector_bridges_2) 
			+ (list opt_garbage_collector_bridges_3)
			+ (list opt_garbage_collector_bridges_4)
			+ (list opt_garbage_collector_bridges_5)
			+ (list opt_garbage_collector_bridges_6)
			+ (list opt_garbage_collector_bridges_7)
			+ (list opt_garbage_collector_bridges_8)
			+ (list opt_garbage_collector_bridges_9);


if (!(_vec isKindOf "CAManBase") and (_vec in _triggerUnits)) then {
    [_vec] spawn {
        params ["_vec"];
        sleep 300;
        deleteVehicle _vec;
    };
};