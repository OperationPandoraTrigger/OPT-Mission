/**
* Author: James
* initialize CBA class EH
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBAClassEvents.sqf;
*
*/
#include "script_component.hpp"

["LandVehicle", "init", {
    params ["_vec"];
    
    _vec addAction [
        "<t color='#ff0000'>" + STR_FIELD_REPAIR + "</t>", 
        {[_this select 0] call FUNC(repairVehicle)},
        [], 
        -1, 
        false,
        true, 
        '',
        QUOTE([_target] call FUNC(needRepair))
    ];

    _vec addAction [
        "<t color='#ff0000'>" + STR_FIELD_REFUEL + "</t>", 
        {[_this select 0] call FUNC(refuelVehicle)},
        [], 
        -1, 
        false,
        true, 
        '',
        QUOTE([_target] call FUNC(vehicleNoFuel))
    ];

    _vec addAction [
        "<t color='#008507'>" + STR_SERIOUS_REPAIR + "</t>", 
        {[_this select 0] call FUNC(heavyRepair)},
        [], 
        -1, 
        false, 
        true, 
        '',
        format["_truck = vehicle _this; ([_target] call %1 || damage _target > 0.1)  and _truck getVariable ['%2', -1] > 0 and {alive _target} and {speed _truck < 3}", QFUNC(vehicleDamaged), QGVAR(repair_cargo)]
    ];

    if (typeOf _vec  == "OPT_O_T_Truck_03_repair_ghex_F" || typeOf _vec == "OPT_O_Truck_03_repair_F" || typeOf _vec  == "OPT_B_Truck_01_Repair_F") then {
    // if (getRepairCargo _vec > 0) then {
        // [_vec, 0] remoteExecCall ["setRepairCargo", _vec, true];
        _vec setVariable [QGVAR(repair_cargo), DEFAULT_REPAIR_TRUCK_USES, true];

        _vec addAction [
            "<t color='#ffff00'>" + STR_CHECK_REPAIRS + "</t>", 
            {[_this select 0] call FUNC(checkRepairs)},
            [], 
            -1, 
            false, 
            true, 
            '',
            ''
        ];
    };

}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Air", "init", {
    params ["_vec"];

    _vec addAction [
        "<t color='#ff0000'>" + STR_FIELD_REPAIR + "</t>", 
        {[_this select 0] call FUNC(repairVehicle)},
        [], 
        -1, 
        false,
        true, 
        '',
        QUOTE([_target] call FUNC(needRepair))
    ];

    _vec addAction [
        "<t color='#dd0000'>" + STR_FIELD_REFUEL + "</t>", 
        {[_this select 0] call FUNC(refuelVehicle)},
        [], 
        -1, 
        false,
        true, 
        '',
        QUOTE([_target] call FUNC(vehicleNoFuel))
    ];

    _vec addAction [
        "<t color='#008507'>" + STR_SERIOUS_REPAIR + "</t>", 
        {[_this select 0] call FUNC(heavyRepair)},
        [], 
        -1, 
        false, 
        true, 
        '',
        format["_truck = vehicle _this; ([_target] call %1 || damage _target > 0.1)  and _truck getVariable ['%2', -1] > 0 and {alive _target} and {speed _truck < 3}", QFUNC(vehicleDamaged), QGVAR(repair_cargo)]
    ];
    }, nil, nil, true] call CBA_fnc_addClassEventHandler;