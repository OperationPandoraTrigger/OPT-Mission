/**
* Author: James
* check if unit can do first aid action
*
* Arguments:
* 0: <OBJECT> unit that called the action
*
* Return Value:
* 0: <BOOL> true - patient can use first aid, false - otherwise
*
* Example:
* [patient, healer] call fnc_checkFirstAid.sqf;
*
*/
#include "script_component.hpp"

params ["_target", "_caller"];

private _return = false;
private _multiplier = _target getVariable ["FAR_firstAidMultiplicator", 0];

// damage calculation
private _damagedParts = ({_x > (0) } count (getAllHitPointsDamage _target select 2)) + ([0, 1] select (damage _target > (0))); 

// Make sure player is alive and not unconscious and has at least 25% damage
if(!alive _target || {_target getVariable "FAR_isUnconscious" == 1} || FAR_isDragging || _damagedParts == 0) exitWith {
	_return
};

true

