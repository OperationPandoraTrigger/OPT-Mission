/**
* Author: James
* initialize EH for player associated with TFAR_fnc_activeLrRadio
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initPlayerEH.sqf;
*
*/
#include "script_component.hpp"

player addEventHandler ["GetInMan", {
    /*
    unit: Object - Unit the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    vehicle: Object - Vehicle the unit entered
    turret: Array - turret path
    */
    params ["_unit", "_pos", "_veh", "_turret"];

    // check if there is a radio in the vehicle
    if (_veh call TFAR_fnc_hasVehicleRadio) then {
        _VehicleLR = player call TFAR_fnc_VehicleLR;
        _encryption = _VehicleLR call TFAR_fnc_getLrRadioCode;
        
        // Check if vehicle was occupied by other team. IF so, we change the encryption to match the team again.
        switch (PLAYER_SIDE) do {
            case west: {
                if (toLower(_encryption) == "_opfor") then {
                    [_VehicleLR, "_bluefor"] call TFAR_fnc_setLrRadioCode;
                    systemChat "Die Funk-Verschlüsselung wurde geändert.";
                };
            };
            case east:  {
                if (toLower(_encryption) == "_bluefor") then {
                    [_VehicleLR, "_opfor"] call TFAR_fnc_setLrRadioCode;
                    systemChat "Die Funk-Verschlüsselung wurde geändert.";
                };            
            };
        };
    };

}];
