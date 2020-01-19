/**
* Author: James
* initialize server mission EH
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initServerMissionEH.sqf;
*
*/
#include "script_component.hpp"

GVAR(EH_PlayerConnected) = addMissionEventHandler ["PlayerConnected", {
    /*
    id: Number - unique DirectPlay ID (very large number). It is also the same id used for user placed markers (same as _id param)
    uid: String - getPlayerUID of the joining client. The same as Steam ID (same as _uid param)
    name: String - profileName of the joining client (same as _name param)
    jip: Boolean - didJIP of the joining client (same as _jip param)
    owner: Number - owner id of the joining client (same as _owner param)
    */
    params ["_id", "_uid", "_name", "_jip", "_owner"];
    //LOG_2("PlayerConnected - jip: %1 - owner: %2",_jip,_owner);
    
    if (OPT_PARAM_SHOW_INTRO and !EGVAR(training,on) and !(_jip)) then {
        [] remoteExec [QFUNC(intro), _owner, false];
    };

}];

GVAR(EH_EntityRespawned) = addMissionEventHandler ["EntityRespawned", {
    params ["_newEntity", "_oldEntity"];

    // respawn costs
    if !(_oldEntity isEqualTo objNull) then {

        // add to zeus
        [_newEntity] remoteExecCall [QEFUNC(common,addToCurator), 2, false];
        
        // Kosten für Seite abziehen + log
        private _cost = [] call FUNC(respawnCost);

	    [UNIT_NAME(_newEntity), UNIT_SIDE(_newEntity), typeOf _newEntity, _cost, "-", "respawn"] call EFUNC(common,updateBudget);
        ["Respawn", format["Spieler: %1", UNIT_NAME(_newEntity)]] call EFUNC(log,write);

        // reset earplugs
        {GVAR(earplugsInUse) = 1;} remoteExecCall ["call", _newEntity, false];

        // give backpack back to player
        // fix BackpackonChest Bug #15
        [] remoteExecCall [QFUNC(addBackpack), _newEntity, true];

    };

    // renew zeus
    [_newEntity] call EFUNC(common,renewCurator);

}];

GVAR(EH_EntityKilled) = addMissionEventHandler ["EntityKilled", {
    params ["_killed", "_killer", "_instigator", "_useEffects"];

    // Funkgeräte löschen
    _inventory = (assignedItems _killed) + (items _killed);
    if ((backpack _killed find "TFAR_" == 0) or (backpack _killed find "tf_" == 0)) then {
        removeBackpackGlobal _killed;
    };


    {
        if ((_x find "TFAR_" == 0) or (_x find "tf_" == 0)) then {
            _killed unassignItem _x;
            _killed removeItem _x;

        };
    } foreach _inventory;

}];

// delete body if unit disconnects
GVAR(EH_PlayerDisconnected) = addMissionEventHandler ["PlayerDisconnected", {
    /*
        id: Number - unique DirectPlay ID (very large number). It is also the same id used for user placed markers (same as _id param)
        uid: String - getPlayerUID of the leaving client. The same as Steam ID (same as _uid param)
        name: String - profileName of the leaving client (same as _name param)
        jip: Boolean - didJIP of the leaving client (same as _jip param)
        owner: Number - owner id of the leaving client (same as _owner param)
    */
    params ["_id", "_uid", "_name", "_jip", "_owner"];

    {
        if (_x getVariable [QGVARMAIN(ownerID), 0] == _owner) then {
            deleteVehicle _x;
        };

    } forEach playableUnits;
}];