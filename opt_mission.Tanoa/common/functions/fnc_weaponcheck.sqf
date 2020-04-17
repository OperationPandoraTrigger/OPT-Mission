﻿/**
* Author: James
* handle taken weapon according to player class
*
* Arguments:
*   unit: Object - Unit to which the event handler is assigned
*   container: Object - The container from which the item was taken (vehicle, box, etc.)
*   item: String - The class name of the taken item
*
* Return Value:
* None
*
* Example:
* [unit, container, item] call fnc_weaponCheck.sqf;
*
*/
#include "script_component.hpp"

params ["_unit", "_container","_item"];
private _typeOfPlayer = typeOf _unit;
private _bad_item_used = false;

// check SMG
if !(_typeOfPlayer in (GVARMAIN(officer) + GVARMAIN(pilots) + GVARMAIN(crew))) then {
    {
        if (_x in GVARMAIN(SMG)) then {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check Light launcher
if !(_typeOfPlayer in GVARMAIN(Lightrocketmen)) then {
    {
        if (_x in GVARMAIN(lightlaunchers)) then {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check Heavy launcher
if !(_typeOfPlayer in GVARMAIN(Heavyrocketmen)) then {
    {
        if (_x in GVARMAIN(Heavylaunchers)) then {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check AA launcher
if !(_typeOfPlayer in GVARMAIN(AArocketmen)) then {
    {
        if (_x in GVARMAIN(AAlaunchers)) then {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check recon Sniper
if !(_typeOfPlayer in GVARMAIN(reconSnipers)) then {
    {
        if (_x in GVARMAIN(reconSniperRifles)) then {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check sniper
if !(_typeOfPlayer in GVARMAIN(snipers)) then {
    {
        if (_x in GVARMAIN(sniperRifles)) then {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check DMR Sniper
if !(_typeOfPlayer in GVARMAIN(DMRsnipers)) then {
    {
        if (_x in GVARMAIN(DMRsniperRifles)) then {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check MG
if !(_typeOfPlayer in GVARMAIN(soldatMG)) then {
    {
        if (_x in GVARMAIN(MG)) then {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check SMG
if !(_typeOfPlayer in GVARMAIN(soldatSMG)) then {
    {
        if (_x in GVARMAIN(SMG)) then {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check recon
if !(_typeOfPlayer in GVARMAIN(recon)) then {
    {
        if (_x in GVARMAIN(reconRifles)) then {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check grenade launcher
if !(_typeOfPlayer in GVARMAIN(grenadiers)) then {
    {
        if (_x in GVARMAIN(grenadelaunchers)) then {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check UAV Terminal
if !(_typeOfPlayer in GVARMAIN(operator)) then {
    {
        _unit unassignItem _x; 
        _unit removeItems _x
    } forEach ["B_UavTerminal","O_UavTerminal"];
};

// check medic item
if !(_typeOfPlayer in GVARMAIN(medic)) then {
    {
        _unit removeItems _x;
    } forEach ["Medikit"]; //TODO: ACE
};

// check Lasermarker
if !(_typeOfPlayer in GVARMAIN(spaeher)) then {
    {
        _unit removeWeapon _x;
    } forEach ["OPT_Laserdesignator","OPT_Laserdesignator_02","OPT_Laserdesignator_01_khk_F","OPT_Laserdesignator_02_ghex_F"];
};

if (_bad_item_used) then {
    ["Regelverstoß", "Waffe unzulässig für aktuelle Spielerklasse.<br/>Waffe wurde entfernt.", "red"] call EFUNC(gui,message);
};